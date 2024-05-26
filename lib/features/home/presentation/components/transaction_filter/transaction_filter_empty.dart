import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

class TransactionFilterEmpty extends StatelessWidget {
  const TransactionFilterEmpty({
    super.key,
    required this.incomeTransactionCategories,
    required this.expenseTransactionCategories,
  });

  final List<TransactionCategoryEntity> incomeTransactionCategories;
  final List<TransactionCategoryEntity> expenseTransactionCategories;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              locator
                  .get<MoneyTrackerStore>()
                  .applyTransactionTypeFilter(TransactionType.expense);
            },
            child: _ThumbnailMoney(
              listTransactionCategories: expenseTransactionCategories,
              name: context.locale.expenses,
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              locator
                  .get<MoneyTrackerStore>()
                  .applyTransactionTypeFilter(TransactionType.income);
            },
            child: _ThumbnailMoney(
              listTransactionCategories: incomeTransactionCategories,
              name: context.locale.incomes,
            ),
          ),
        ),
      ],
    );
  }
}

class _ThumbnailMoney extends StatelessWidget {
  const _ThumbnailMoney({
    required this.listTransactionCategories,
    required this.name,
  });

  final List<TransactionCategoryEntity> listTransactionCategories;
  final String name;

  @override
  Widget build(BuildContext context) {
    final double totalAmount =
        listTransactionCategories.fold(0, (sum, item) => sum + item.amount);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.onyx10,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            FormatString.amountForUser(totalAmount),
            style: AppTextStyle.textAppBody1SemiBold,
          ),
          const Gap(2),
          Text(
            name,
            style: AppTextStyle.textAppBody1Medium,
          ),
          const Gap(4),
          _CategoryBar(
            categories: listTransactionCategories,
            totalAmount: totalAmount,
          ),
          const Gap(4),
        ],
      ),
    );
  }
}

class _CategoryBar extends StatelessWidget {
  const _CategoryBar({
    required this.categories,
    required this.totalAmount,
  });

  final List<TransactionCategoryEntity> categories;
  final double totalAmount;

  @override
  Widget build(BuildContext context) {
    final sortedCategories = List<TransactionCategoryEntity>.from(categories)
      ..sort((a, b) => b.amount.compareTo(a.amount));

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 10,
        child: Row(
          children: sortedCategories.map((category) {
            final double percentage = category.amount / totalAmount;
            return Expanded(
              flex: (percentage * 100).toInt(),
              child: Container(
                color: category.getColorForCategory(),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
