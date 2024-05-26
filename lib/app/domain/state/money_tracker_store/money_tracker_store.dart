import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:money_tracker/app/domain/modal/filter/filter_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';

import 'package:money_tracker/app/domain/state/money_tracker_store/money_tracker_state.dart';

@LazySingleton()
class MoneyTrackerStore extends HydratedCubit<MoneyTrackerState> {
  MoneyTrackerStore() : super(const MoneyTrackerState(transactionsList: []));

  @override
  MoneyTrackerState? fromJson(Map<String, dynamic> json) {
    return MoneyTrackerState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(MoneyTrackerState state) {
    return state.toJson();
  }

  /// Добавить транзакцию в список
  void addedTransaction(TransactionEntity entity) {
    List<TransactionEntity> transactionsList = List.from(state.transactionsList)
      ..add(
          entity.copyWith(id: DateTime.now().millisecondsSinceEpoch.toString()))
      ..sort((a, b) => b.date.compareTo(a.date));
    emit(state.copyWith(transactionsList: transactionsList));
    if (!state.filterEntity.isEmptyAllFilters) {
      _applyAllFilter(state.filterEntity);
    }
  }

  /// Удалить транзакцию из списка
  void deleteTransaction(String id) {
    List<TransactionEntity> transactionsList = List.from(state.transactionsList)
      ..removeWhere((transaction) => transaction.id == id);
    emit(state.copyWith(transactionsList: transactionsList));
    if (!state.filterEntity.isEmptyAllFilters) {
      _applyAllFilter(state.filterEntity);
    }
  }

  /// Поменять транзакцию из списка
  void editTransaction(TransactionEntity entity) {
    List<TransactionEntity> transactionsList =
        List.from(state.transactionsList);
    final index = transactionsList
        .indexWhere((transaction) => transaction.id == entity.id);
    if (index == -1) {
      return;
    }
    transactionsList[index] = entity;
    transactionsList.sort((a, b) => b.date.compareTo(a.date));
    emit(state.copyWith(transactionsList: transactionsList));
    _applyAllFilter(state.filterEntity);
  }

  /// Установить и Поменять лимит для категории
  void createAndEditLimitCategory(
      {required TransactionCategoryEntity transactionCategoryEntity}) {
    List<TransactionCategoryEntity> updatedList = List.from(
        state.limitedCategoryList)
      ..removeWhere((category) => category.key == transactionCategoryEntity.key)
      ..add(transactionCategoryEntity);
    emit(state.copyWith(limitedCategoryList: updatedList));
  }

  /// Удалить лимит для категории
  void deleteLimitCategory({required String categoryKey}) {
    List<TransactionCategoryEntity> updatedList =
        List.from(state.limitedCategoryList)
          ..removeWhere((category) => category.key == categoryKey);
    emit(state.copyWith(limitedCategoryList: updatedList));
  }

  /// Поменять Тип транзакции в фильтре
  void applyTransactionTypeFilter(TransactionType? type) =>
      _applyAllFilter(state.filterEntity.copyWith(type: type));

  /// Поиск по отфильтрованному списку
  void searchTransactionFilter(String query) =>
      _applyAllFilter(state.filterEntity.copyWith(searchQuery: query));

  /// Поменять Категорию транзакции в фильтре
  void applyTransactionCategoryFilter(
          TransactionCategoryEntity? categoryEntity) =>
      _applyAllFilter(state.filterEntity.copyWith(category: categoryEntity));

  /// Поменять Даты в фильтре
  void applyDatesFilter(
          {required DateTime? startDate, required DateTime? endDate}) =>
      _applyAllFilter(
          state.filterEntity.copyWith(startDate: startDate, endDate: endDate));

  /// Очистить фильтрацию
  void clearFiltering() => _applyAllFilter(
      FilterEntity(searchQuery: state.filterEntity.searchQuery));

  /// Очистить поиск
  void clearSearchQuery() =>
      _applyAllFilter(state.filterEntity.copyWith(searchQuery: null));

  /// Применить фильтрацию и поиск
  void _applyAllFilter(FilterEntity filterEntity) {
    List<TransactionEntity> transactionsList =
        List.from(state.transactionsList);
    DateTime? startDate = filterEntity.startDate;
    DateTime? endDate = filterEntity.endDate;
    TransactionCategoryEntity? transactionCategoryEntity =
        filterEntity.category;
    TransactionType? transactionType = filterEntity.type;
    String? searchQuery = filterEntity.searchQuery;

    /// применяем фильтр даты
    if (startDate != null && endDate != null) {
      transactionsList = transactionsList
          .where((element) =>
              element.date.isAfter(startDate) && element.date.isBefore(endDate))
          .toList();
    }

    /// применяем фильтр категории
    if (transactionCategoryEntity != null) {
      transactionsList = transactionsList
          .where((element) =>
              element.category.key == transactionCategoryEntity.key)
          .toList();
    }

    /// применяем фильтр типа транзакции
    if (transactionType != null) {
      transactionsList = transactionsList
          .where((element) => element.type == transactionType)
          .toList();
    }

    /// поиск по отсортированному списку
    if (searchQuery != null) {
      transactionsList = transactionsList.where((transaction) {
        return transaction.name
            .toLowerCase()
            .contains(searchQuery.toLowerCase());
      }).toList();
    }

    emit(state.copyWith(
      /// очищаем фильтры, если у список транзакций пуст
      filterEntity:
          state.transactionsList.isEmpty ? const FilterEntity() : filterEntity,
      filteredTransactionsList: transactionsList,
    ));
  }
}
