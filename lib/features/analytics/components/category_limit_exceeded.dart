import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

class CategoryLimitExceeded extends StatelessWidget {
  const CategoryLimitExceeded({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${context.locale.budgetLimits}:',
              style: AppTextStyle.defaultHeadline2,
            ),
            const Gap(16),
            Column(
              children: [
                for (var item in state.categoriesWithAmount) ...[
                  _LimitCategoryTile(
                    key: ValueKey(item.key),
                    categoryEntity: item,
                  ),
                  const Gap(8)
                ],
              ],
            ),
          ],
        );
      },
    );
  }
}

class _LimitCategoryTile extends StatefulWidget {
  const _LimitCategoryTile({required this.categoryEntity, super.key});

  final TransactionCategoryEntity categoryEntity;

  @override
  State<_LimitCategoryTile> createState() => _LimitCategoryTileState();
}

class _LimitCategoryTileState extends State<_LimitCategoryTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation =
        Tween<double>(begin: 1.0, end: 0.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              locator
                  .get<MoneyTrackerStore>()
                  .deleteLimitCategory(categoryKey: widget.categoryEntity.key);
            }
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: _animation.value,
      child: Slidable(
        key: widget.key,
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                _animationController.forward();
              },
              backgroundColor: AppColors.red,
              foregroundColor: AppColors.white,
              icon: Icons.delete,
              label: context.locale.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.categoryEntity.amount >
                      widget.categoryEntity.limitAmount
                  ? AppColors.red
                  : AppColors.transparent,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${context.locale.category}:",
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                  Text(
                    widget.categoryEntity.nameForUser(context),
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${context.locale.currentExpense}:",
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                  Text(
                    FormatString.amountForUser(widget.categoryEntity.amount),
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${context.locale.limit}:",
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                  Text(
                    FormatString.amountForUser(
                        widget.categoryEntity.limitAmount),
                    style: AppTextStyle.textAppearanceBody2,
                  ),
                ],
              ),
              if (widget.categoryEntity.amount >
                  widget.categoryEntity.limitAmount)
                Text(
                  '${context.locale.limitExceeded}!',
                  style: AppTextStyle.defaultBody.copyWith(
                      color: widget.categoryEntity.amount >
                              widget.categoryEntity.limitAmount
                          ? AppColors.red
                          : AppColors.transparent),
                )
            ],
          ),
        ),
      ),
    );
  }
}
