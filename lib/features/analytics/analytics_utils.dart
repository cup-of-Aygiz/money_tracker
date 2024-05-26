import 'dart:math';

import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';

class AnalyticsUtils {
  /// возвращает максимальную сумму (дохода или расхода) транзакций за
  /// определенной количество дней с текущей даты
  static double calculateMaxAmountByDate({
    required int days,
    required List<TransactionEntity> transactions,
  }) {
    DateTime lastDate = DateTime.now().subtract(Duration(days: days));

    Map<DateTime, double> dailyExpenseAmounts = {};
    Map<DateTime, double> dailyIncomeAmounts = {};

    transactions
        .where((transaction) => transaction.date.isAfter(lastDate))
        .forEach((transaction) {
      DateTime date = DateTime(
        transaction.date.year,
        transaction.date.month,
        transaction.date.day,
      );
      if (transaction.type == TransactionType.expense) {
        if (dailyExpenseAmounts.containsKey(date)) {
          dailyExpenseAmounts[date] =
              dailyExpenseAmounts[date]! + transaction.amount;
        } else {
          dailyExpenseAmounts[date] = transaction.amount;
        }
      } else if (transaction.type == TransactionType.income) {
        if (dailyIncomeAmounts.containsKey(date)) {
          dailyIncomeAmounts[date] =
              dailyIncomeAmounts[date]! + transaction.amount;
        } else {
          dailyIncomeAmounts[date] = transaction.amount;
        }
      }
    });

    double maxExpenseAmount = dailyExpenseAmounts.values
        .fold(0, (prev, amount) => prev > amount ? prev : amount);
    double maxIncomeAmount = dailyIncomeAmounts.values
        .fold(0, (prev, amount) => prev > amount ? prev : amount);

    double maxAmount =
        maxExpenseAmount > maxIncomeAmount ? maxExpenseAmount : maxIncomeAmount;

    return maxAmount;
  }

  static double calculateMaxAmountByType({
    required TransactionType type,
    required List<TransactionEntity> transactions,
  }) {
    Map<TransactionCategoryEntity, double> categoryAmounts = {};

    for (var transaction in transactions) {
      if (transaction.type == type) {
        TransactionCategoryEntity category = transaction.category;
        categoryAmounts.update(category, (value) => value + transaction.amount,
            ifAbsent: () => transaction.amount);
      }
    }

    double maxAmount =
        categoryAmounts.values.fold(0, (prev, amount) => max(prev, amount));

    return maxAmount;
  }
}
