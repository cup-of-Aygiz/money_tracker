import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/features/analytics/analytics_utils.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/utils/date_time/date_time_utils.dart';

import 'package:money_tracker/features/analytics/components/not_enough_analytics_data.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

class AnalyticsByYear extends StatelessWidget {
  const AnalyticsByYear({
    super.key,
    required this.transactions,
    required this.aspectRatio,
  });

  final List<TransactionEntity> transactions;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    final maxY = AnalyticsUtils.calculateMaxAmountByDate(
        days: 365, transactions: transactions);
    if (maxY == 0) {
      return const NotEnoughAnalyticsData();
    }
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => AppColors.black,
              getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                return lineBarsSpot.map((LineBarSpot lineBarSpot) {
                  final DateTime date = DateTime(
                    DateTime.now().year,
                    1,
                    1,
                  ).add(Duration(days: lineBarSpot.x.toInt() - 1));
                  return LineTooltipItem(
                    FormatString.amountForUser(lineBarSpot.y),
                    TextStyle(
                        color: lineBarSpot.barIndex == 0
                            ? AppColors.red
                            : AppColors.green,
                        fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: "\n${DateFormat(FormatDate.month).format(
                          date,
                        )}",
                        style: const TextStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }).toList();
              },
            ),
          ),
          maxX: DateTime.now()
                  .difference(DateTime(DateTime.now().year, 1, 1))
                  .inDays
                  .toDouble() +
              2,
          minX: transactions.isEmpty
              ? 1
              : transactions
                  .map((transaction) => transaction.date)
                  .reduce((min, date) => date.isBefore(min) ? date : min)
                  .difference(DateTime(DateTime.now().year, 1, 1))
                  .inDays
                  .toDouble(),
          minY: 0,
          maxY: maxY,
          titlesData: const FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          gridData: const FlGridData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: _getLineChartSpots(TransactionType.expense),
              isCurved: true,
              color: AppColors.red,
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
            LineChartBarData(
              spots: _getLineChartSpots(TransactionType.income),
              isCurved: true,
              color: AppColors.green,
              barWidth: 2,
              isStrokeCapRound: true,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  List<FlSpot> _getLineChartSpots(TransactionType type) {
    Map<int, double> dailyTransactions = {};
    for (var transaction in transactions) {
      if (transaction.type == type &&
          transaction.date.year == DateTime.now().year &&
          transaction.date.isAfter(DateTime(DateTime.now().year, 1, 1))) {
        int dayOfYear = transaction.date
                .difference(DateTime(transaction.date.year, 1, 1))
                .inDays +
            1;
        if (dailyTransactions.containsKey(dayOfYear)) {
          dailyTransactions[dayOfYear] =
              dailyTransactions[dayOfYear]! + transaction.amount;
        } else {
          dailyTransactions[dayOfYear] = transaction.amount;
        }
      }
    }

    List<FlSpot> spots = [];
    dailyTransactions.forEach((key, value) {
      spots.add(FlSpot(key.toDouble(), value));
    });
    return spots;
  }
}
