import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/features/analytics/analytics_utils.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';

class AnalyticsByWeek extends StatelessWidget {
  const AnalyticsByWeek({super.key, required this.transactions});

  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: AnalyticsUtils.calculateMaxAmountByDate(
          days: 7,
          transactions: transactions,
        ),
        barGroups: _getBarGroups(7),
        barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => AppColors.black,
        )),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups(int days) {
    DateTime currentDate = DateTime.now();
    List<BarChartGroupData> barGroups = [];
    for (int i = days - 1; i >= 0; i--) {
      DateTime date = currentDate.subtract(Duration(days: i));
      double expenseAmount = transactions
          .where((transaction) =>
              transaction.type == TransactionType.expense &&
              transaction.date.year == date.year &&
              transaction.date.month == date.month &&
              transaction.date.day == date.day)
          .map((transaction) => transaction.amount)
          .fold(0, (prev, amount) => prev + amount);
      double incomeAmount = transactions
          .where((transaction) =>
              transaction.type == TransactionType.income &&
              transaction.date.year == date.year &&
              transaction.date.month == date.month &&
              transaction.date.day == date.day)
          .map((transaction) => transaction.amount)
          .fold(0, (prev, amount) => prev + amount);

      barGroups.add(
        BarChartGroupData(
          x: days - 1 - i,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
              toY: incomeAmount,
              color: AppColors.green,
              width: 8,
            ),
            BarChartRodData(
              toY: expenseAmount,
              color: AppColors.red,
              width: 8,
            ),
          ],
        ),
      );
    }
    return barGroups;
  }
}
