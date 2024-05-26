import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';

class AnalyticsByAllTime extends StatelessWidget {
  const AnalyticsByAllTime({
    super.key,
    required this.transactions,
  });

  final List<TransactionEntity> transactions;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: [
          PieChartSectionData(
            title: 'Расходы',
            color: AppColors.red,
            value: _calculateTotalAmount(TransactionType.expense),
          ),
          PieChartSectionData(
            title: 'Доходы',
            color: AppColors.green,
            value: _calculateTotalAmount(TransactionType.income),
          ),
        ],
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
