import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/features/analytics/components/not_enough_analytics_data.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';

class AnalyticsByAllTime extends StatelessWidget {
  const AnalyticsByAllTime({
    super.key,
    required this.transactions,
    required this.aspectRatio,
  });

  final List<TransactionEntity> transactions;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final expenseAmount = _calculateTotalAmount(TransactionType.expense);
    final incomeAmount = _calculateTotalAmount(TransactionType.income);
    if (incomeAmount == 0 && expenseAmount == 0) {
      return const NotEnoughAnalyticsData();
    }
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              title: 'Расходы',
              color: AppColors.red,
              value: expenseAmount,
            ),
            PieChartSectionData(
              title: 'Доходы',
              color: AppColors.green,
              value: incomeAmount,
            ),
          ],
        ),
      ),
    );
  }

  double _calculateTotalAmount(TransactionType type) {
    return transactions
        .where((transaction) => transaction.type == type)
        .map((transaction) => transaction.amount)
        .fold(0, (prev, amount) => prev + amount);
  }
}
