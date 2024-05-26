// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/app/domain/modal/filter/filter_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';

part 'money_tracker_state.freezed.dart';

part 'money_tracker_state.g.dart';

@freezed
class MoneyTrackerState with _$MoneyTrackerState {
  const factory MoneyTrackerState({
    /// список всех транзакций
    required List<TransactionEntity> transactionsList,

    /// отфильтрованные транзакции
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default([])
    List<TransactionEntity> filteredTransactionsList,

    /// список категорий с лимитами
    @Default([]) List<TransactionCategoryEntity> limitedCategoryList,

    /// фильтр транзакций
    @JsonKey(includeFromJson: false, includeToJson: false)
    @Default(FilterEntity())
    FilterEntity filterEntity,
  }) = _MoneyTrackerState;

  factory MoneyTrackerState.fromJson(Map<String, dynamic> json) =>
      _$MoneyTrackerStateFromJson(json);
}

extension MoneyTrackerStateHelper on MoneyTrackerState {
  ///  список убытков пользователя
  List<TransactionEntity> get expenseTransactions {
    return transactionsList
        .where((element) => element.type == TransactionType.expense)
        .toList();
  }

  ///  список прибыли пользователя
  List<TransactionEntity> get incomeTransactions {
    return transactionsList
        .where((element) => element.type == TransactionType.income)
        .toList();
  }

  /// Список транзакций расходов текущего месяца
  List<TransactionEntity> get currentMonthExpenseTransactions {
    DateTime now = DateTime.now();
    return transactionsList
        .where((transaction) =>
            transaction.date.year == now.year &&
            transaction.date.month == now.month &&
            transaction.type == TransactionType.expense)
        .toList();
  }

  /// Возвращает список с категорий с лимитом и суммой за текущий месяц
  List<TransactionCategoryEntity> get categoriesWithAmount {
    Map<String, double> categoryAmountMap = {};
    for (var transaction in currentMonthExpenseTransactions) {
      String categoryKey = transaction.category.key;
      categoryAmountMap[categoryKey] =
          (categoryAmountMap[categoryKey] ?? 0) + transaction.amount;
    }

    List<TransactionCategoryEntity> categoriesWithAmount = limitedCategoryList
        .map((category) => TransactionCategoryEntity(
              key: category.key,
              amount: categoryAmountMap.containsKey(category.key)
                  ? categoryAmountMap[category.key]!
                  : 0,
              limitAmount: category.limitAmount,
            ))
        .toList();

    return categoriesWithAmount;
  }

  /// возвращает отфильтрованные транзакции если есть фильтр,
  /// если нет все транзакции
  List<TransactionEntity> get showTransactions {
    return filterEntity.isEmptyAllFilters == false
        ? filteredTransactionsList
        : transactionsList;
  }

  /// список категорий расходов пользователя с суммой по категории
  List<TransactionCategoryEntity> get expenseTransactionCategories {
    final Map<String, double> categoryAmounts = {};
    final List<TransactionEntity> transactions = showTransactions;

    for (var transaction in transactions) {
      if (transaction.type == TransactionType.expense) {
        final key = transaction.category.key;
        if (categoryAmounts.containsKey(key)) {
          categoryAmounts[key] = categoryAmounts[key]! + transaction.amount;
        } else {
          categoryAmounts[key] = transaction.amount;
        }
      }
    }

    return categoryAmounts.entries.map((entry) {
      return TransactionCategoryEntity(key: entry.key, amount: entry.value);
    }).toList();
  }

  /// список категорий доходов пользователя с суммой по категории
  List<TransactionCategoryEntity> get incomeTransactionCategories {
    final Map<String, double> categoryAmounts = {};
    final List<TransactionEntity> transactions = showTransactions;

    for (var transaction in transactions) {
      if (transaction.type == TransactionType.income) {
        final key = transaction.category.key;
        if (categoryAmounts.containsKey(key)) {
          categoryAmounts[key] = categoryAmounts[key]! + transaction.amount;
        } else {
          categoryAmounts[key] = transaction.amount;
        }
      }
    }

    return categoryAmounts.entries.map((entry) {
      return TransactionCategoryEntity(key: entry.key, amount: entry.value);
    }).toList();
  }

  /// возвращает есть ли лимит по категории оп ключу
  bool categoryExists(String categoryKey) {
    return limitedCategoryList.any((category) => category.key == categoryKey);
  }
}
