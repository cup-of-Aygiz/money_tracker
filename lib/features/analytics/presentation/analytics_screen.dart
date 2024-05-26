import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/features/analytics/components/analytics_by_all_time.dart';
import 'package:money_tracker/features/analytics/components/analytics_by_category.dart';
import 'package:money_tracker/features/analytics/components/analytics_by_week.dart';
import 'package:money_tracker/features/analytics/components/analytics_by_year.dart';
import 'package:money_tracker/features/analytics/components/analytics_chart_and_title.dart';
import 'package:money_tracker/features/analytics/components/category_limit_exceeded.dart';
import 'package:money_tracker/localization/localization.dart';

@RoutePage()
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoneyTrackerStore, MoneyTrackerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(context.locale.analytics),
          ),
          body: ListView(
            children: [
              const Gap(32),
              const Padding(
                padding: EdgeInsets.all(16),
                child: CategoryLimitExceeded(),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnalyticsChartAndTitle(
                  title: context.locale.analyticsAllTime,
                  aspectRatio: 2,
                  child: AnalyticsByAllTime(
                    transactions: state.transactionsList,
                  ),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnalyticsChartAndTitle(
                  title: context.locale.analyticsYear,
                  child: AnalyticsByYear(
                    transactions: state.transactionsList,
                  ),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnalyticsChartAndTitle(
                  title: context.locale.analyticsWeek,
                  child: AnalyticsByWeek(
                    transactions: state.transactionsList,
                  ),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnalyticsChartAndTitle(
                  title: context.locale.analyticsAllExpenses,
                  aspectRatio: null,
                  child: ChartWidget(
                    type: TransactionType.expense,
                    transactions: state.transactionsList,
                  ),
                ),
              ),
              const Gap(16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnalyticsChartAndTitle(
                  title: context.locale.analyticsAllIncomes,
                  aspectRatio: null,
                  child: ChartWidget(
                    type: TransactionType.income,
                    transactions: state.transactionsList,
                  ),
                ),
              ),
              const Gap(32),
            ],
          ),
        );
      },
    );
  }
}
