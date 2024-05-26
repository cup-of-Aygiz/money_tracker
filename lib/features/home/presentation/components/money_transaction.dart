import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/router/app_router.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';
import 'package:money_tracker/utils/date_time/date_time_utils.dart';

class MoneyTransaction extends StatefulWidget {
  const MoneyTransaction({
    super.key,
    required this.transactionEntity,
  });

  final TransactionEntity transactionEntity;

  @override
  State<MoneyTransaction> createState() => _MoneyTransactionState();
}

class _MoneyTransactionState extends State<MoneyTransaction>
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
                  .deleteTransaction(widget.transactionEntity.id);
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
        startActionPane: ActionPane(
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
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                context.pushRoute(EditTransactionRoute(
                  transactionEntity: widget.transactionEntity,
                ));
              },
              backgroundColor: AppColors.blue,
              foregroundColor: AppColors.white,
              icon: Icons.settings,
              label: context.locale.edit,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color:
                      widget.transactionEntity.category.getColorForCategory(),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.transactionEntity.category.getIconForCategory(),
                ),
              ),
              const Gap(8),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            widget.transactionEntity.name,
                            style: AppTextStyle.defaultBody
                                .copyWith(color: AppColors.white),
                            minFontSize: 8,
                            maxLines: 1,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          DateFormat(FormatDate.dayMonthYear)
                              .format(widget.transactionEntity.date),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: AutoSizeText(
                            widget.transactionEntity.category
                                .nameForUser(context),
                            style: AppTextStyle.textAppearanceBody1
                                .copyWith(color: AppColors.onyx80),
                            minFontSize: 6,
                            maxLines: 1,
                          ),
                        ),
                        const Gap(8),
                        Text(
                          widget.transactionEntity.amountForUser(),
                          style: AppTextStyle.textAppearanceBody1.copyWith(
                            color:
                                widget.transactionEntity.type.getColorForType(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
