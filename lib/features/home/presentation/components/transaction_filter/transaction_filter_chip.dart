import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/modal/filter/filter_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/date_range_picker_filter.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';
import 'package:money_tracker/utils/date_time/date_time_utils.dart';

class TransactionFilterChip extends StatelessWidget {
  const TransactionFilterChip({
    super.key,
    required this.filterEntity,
  });

  final FilterEntity filterEntity;

  @override
  Widget build(BuildContext context) {
    final startDate = filterEntity.startDate;
    final endDate = filterEntity.endDate;
    return Wrap(
      spacing: 4,
      runSpacing: 8,
      children: [
        const DateRangePicker(),
        if (startDate != null && endDate != null)
          _OffFilterChip(
            onTap: () {
              locator
                  .get<MoneyTrackerStore>()
                  .applyDatesFilter(startDate: null, endDate: null);
            },
            text:
                "${DateFormat(FormatDate.dayMonthYear).format(filterEntity.startDate!)} - ${DateFormat(FormatDate.dayMonthYear).format(filterEntity.endDate!)}",
          ),
        if (filterEntity.type != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _OffFilterChip(
              onTap: () {
                locator.get<MoneyTrackerStore>()
                  ..applyTransactionTypeFilter(null)
                  ..applyTransactionCategoryFilter(null);
              },
              text: filterEntity.type == TransactionType.expense
                  ? context.locale.expenses
                  : context.locale.incomes,
            ),
          ),
        if (filterEntity.category != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: _OffFilterChip(
              onTap: () {
                locator
                    .get<MoneyTrackerStore>()
                    .applyTransactionCategoryFilter(null);
              },
              text: filterEntity.category?.nameForUser(context) ?? '',
            ),
          ),
      ],
    );
  }
}

class _OffFilterChip extends StatelessWidget {
  const _OffFilterChip({
    required this.onTap,
    required this.text,
  });

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.close,
              size: 20,
            ),
            Text(
              text,
              style: AppTextStyle.textAppBody2Bold,
            ),
          ],
        ),
      ),
    );
  }
}
