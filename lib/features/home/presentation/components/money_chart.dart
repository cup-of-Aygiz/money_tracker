import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_store.dart';
import 'package:money_tracker/di/service_locator.dart';
import 'package:money_tracker/features/home/presentation/components/transaction_filter/category_indicator.dart';
import 'package:money_tracker/uikit/colors/app_colors.dart';
import 'package:money_tracker/uikit/text_style/app_text_style.dart';

class MoneyChart extends StatefulWidget {
  const MoneyChart({
    super.key,
    required this.listTransactionCategory,
  });

  final List<TransactionCategoryEntity> listTransactionCategory;

  @override
  State<MoneyChart> createState() => _MoneyChartState();
}

class _MoneyChartState extends State<MoneyChart> {
  int touchedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      longPressDuration: const Duration(seconds: 1),
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                        if (touchedIndex >= 0 &&
                            touchedIndex <
                                widget.listTransactionCategory.length) {
                          locator
                              .get<MoneyTrackerStore>()
                              .applyTransactionCategoryFilter(
                                  widget.listTransactionCategory[touchedIndex]);
                        }
                        if (mounted) {
                          setState(() {});
                        }
                      },
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    sectionsSpace: 0,
                    centerSpaceRadius: 40,
                    sections: showingSections(),
                  ),
                ),
              ),
            ),
          ),
          Wrap(
            runAlignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var item in widget.listTransactionCategory) ...[
                GestureDetector(
                  onTap: () {
                    locator
                        .get<MoneyTrackerStore>()
                        .applyTransactionCategoryFilter(item);
                  },
                  child: CategoryIndicator(
                    categoryEntity: item,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final double amount = widget.listTransactionCategory
        .fold(0, (previousValue, element) => previousValue + element.amount);
    return widget.listTransactionCategory.map((e) {
      final isTouched =
          widget.listTransactionCategory.indexOf(e) == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      return PieChartSectionData(
        color: e.getColorForCategory(),
        value: e.amount / (amount / 100),
        title: '${(e.amount / (amount / 100)).toStringAsFixed(1)}%',
        radius: radius,
        titleStyle: AppTextStyle.defaultBody.copyWith(
          fontSize: fontSize,
          color: AppColors.black,
        ),
      );
    }).toList();
  }
}
