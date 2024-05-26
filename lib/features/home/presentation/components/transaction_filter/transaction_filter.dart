import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/filter/filter_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/features/home/presentation/components/money_chart.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/transaction_filter_chip.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/transaction_filter_empty.dart';

class TransactionFilter extends StatelessWidget {
  const TransactionFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        final FilterEntity filter = state.filterEntity;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TransactionFilterChip(
              filterEntity: filter,
            ),
            const Gap(16),
            Builder(
              builder: (context) {
                final TransactionType? type = filter.type;
                final TransactionCategoryEntity? category = filter.category;
                final listTransactionCategory = type == TransactionType.income
                    ? state.incomeTransactionCategories
                    : state.expenseTransactionCategories;
                if (type != null &&
                    category == null &&
                    listTransactionCategory.isNotEmpty) {
                  return AnimatedSizeAndFade(
                    child: MoneyChart(
                      listTransactionCategory: type == TransactionType.income
                          ? state.incomeTransactionCategories
                          : state.expenseTransactionCategories,
                    ),
                  );
                }
                if (category == null) {
                  return AnimatedSizeAndFade(
                    child: TransactionFilterEmpty(
                      incomeTransactionCategories:
                          state.incomeTransactionCategories,
                      expenseTransactionCategories:
                          state.expenseTransactionCategories,
                    ),
                  );
                }
                return AnimatedSizeAndFade(
                  child: const SizedBox.shrink(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
