import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/filter/filter_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/router/app_router.dart';
import 'package:money_tracker/uikit/button/app_text_button.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

class TransactionsClear extends StatelessWidget {
  const TransactionsClear({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        /// состояние когда у пользователя нет транзакций
        if (state.transactionsList.isEmpty) {
          return _TransactionClearView(
            title: context.locale.listTransactionsIsEmpty,
            buttons: [
              AppTextButton(
                onPressed: () {
                  context.router.navigate(const AddTransactionRoute());
                },
                text: context.locale.addedTransaction,
              )
            ],
          );
        }

        /// состояние когда у пользователя есть транзакций, но по поиску ничего
        /// не найдено
        if (state.filterEntity.searchQuery?.isNotEmpty == true &&
            state.filterEntity.isEmptyFilters) {
          return _TransactionClearView(
            title: context.locale.transactionsWithSearchClear,
            buttons: [
              AppTextButton(
                onPressed: () {
                  locator.get<MoneyTrackerStore>().clearSearchQuery();
                },
                text: context.locale.clearSearchQuery,
              )
            ],
          );
        }

        /// состояние когда у пользователя есть транзакций, но по фильтрам ничего
        /// не найдено
        if ((state.filterEntity.searchQuery == null ||
                state.filterEntity.searchQuery?.isEmpty == true) &&
            !state.filterEntity.isEmptyFilters) {
          return _TransactionClearView(
            title: context.locale.transactionsWithFilterClear,
            buttons: [
              AppTextButton(
                onPressed: () {
                  locator.get<MoneyTrackerStore>().clearFiltering();
                },
                text: context.locale.clearFilter,
              )
            ],
          );
        }

        /// состояние когда у пользователя есть транзакций, но по поиску и
        /// фильтрам ничего не найдено
        if (state.filterEntity.searchQuery?.isNotEmpty == true &&
            !state.filterEntity.isEmptyFilters) {
          return _TransactionClearView(
            title: context.locale.transactionsWithFilterAndSearchClear,
            buttons: [
              AppTextButton(
                onPressed: () {
                  locator.get<MoneyTrackerStore>().clearSearchQuery();
                },
                text: context.locale.clearSearchQuery,
              ),
              const Gap(16),
              AppTextButton(
                onPressed: () {
                  locator.get<MoneyTrackerStore>().clearFiltering();
                },
                text: context.locale.clearFilter,
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _TransactionClearView extends StatelessWidget {
  const _TransactionClearView({
    required this.title,
    required this.buttons,
  });

  final String title;
  final List<Widget> buttons;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.defaultHeadline2,
          textAlign: TextAlign.start,
        ),
        const Gap(8),
        Text(
          '${context.locale.youCan}:',
          style: AppTextStyle.defaultHeadline2,
        ),
        const Gap(8),
        ...buttons,
      ],
    );
  }
}
