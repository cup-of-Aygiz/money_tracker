import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';
import 'package:money_tracker/features/analytics/analytics_utils.dart';
import 'package:money_tracker/features/analytics/components/not_enough_analytics_data.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/category_indicator.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    super.key,
    required this.type,
    required this.transactions,
  });

  final List<TransactionEntity> transactions;
  final TransactionType type;

  @override
  Widget build(BuildContext context) {
    final groupedTransactions = _groupTransactionsByCategory(
      transactions: transactions,
      context: context,
      type: type,
    );
    final barGroups = _createBarGroups(groupedTransactions);
    List<TransactionCategoryEntity> categoryNames =
        groupedTransactions.keys.map((category) => category).toList();
    if (barGroups.isEmpty || barGroups.length == 1) {
      return const NotEnoughAnalyticsData();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: AnalyticsUtils.calculateMaxAmountByType(
                transactions: transactions,
                type: type,
              ),
              groupsSpace: 20,
              barTouchData: BarTouchData(
                enabled: false,
              ),
              titlesData: FlTitlesData(
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    getTitlesWidget: (value, _) {
                      TransactionCategoryEntity category =
                          groupedTransactions.keys.elementAt(value.toInt());
                      return value.toInt() < barGroups.length
                          ? Column(
                              children: [
                                const Gap(4),
                                Container(
                                  decoration: BoxDecoration(
                                    color: category.getColorForCategory(),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child:
                                        category.getIconForCategory(size: 12),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ),
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: true),
              barGroups: barGroups,
            ),
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categoryNames
              .map((categoryName) => CategoryIndicator(
                    categoryEntity: categoryName,
                  ))
              .toList(),
        ),
      ],
    );
  }

  Map<TransactionCategoryEntity, List<TransactionEntity>>
      _groupTransactionsByCategory({
    required List<TransactionEntity> transactions,
    required BuildContext context,
    required TransactionType type,
  }) {
    Map<TransactionCategoryEntity, List<TransactionEntity>>
        groupedTransactions = {};
    for (var transaction in transactions) {
      if (transaction.type == type) {
        TransactionCategoryEntity category = transaction.category;
        if (groupedTransactions.containsKey(category)) {
          groupedTransactions[category]!.add(transaction);
        } else {
          groupedTransactions[category] = [transaction];
        }
      }
    }
    return groupedTransactions;
  }

  List<BarChartGroupData> _createBarGroups(
      Map<TransactionCategoryEntity, List<TransactionEntity>>
          groupedTransactions) {
    List<BarChartGroupData> barGroups = [];
    int index = 0;
    groupedTransactions.forEach((category, categoryTransactions) {
      double totalAmount = categoryTransactions
          .map((transaction) => transaction.amount)
          .fold(0, (prev, amount) => prev + amount);
      barGroups.add(BarChartGroupData(
        x: index,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: totalAmount,
            color: category.getColorForCategory(),
            width: 16,
          ),
        ],
      ));
      index++;
    });
    return barGroups;
  }
}
