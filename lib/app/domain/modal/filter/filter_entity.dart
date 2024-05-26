import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/app/domain/modal/transaction_entity/transaction_entity.dart';

part 'filter_entity.freezed.dart';

@freezed
class FilterEntity with _$FilterEntity {
  const factory FilterEntity({
    TransactionType? type,
    TransactionCategoryEntity? category,
    DateTime? startDate,
    DateTime? endDate,
    String? searchQuery,
  }) = _FilterEntity;
}

extension FilterHelper on FilterEntity {
  bool get isEmptyAllFilters =>
      type == null &&
      category == null &&
      searchQuery == null &&
      (startDate == null || endDate == null);

  bool get isEmptyFilters =>
      type == null &&
      category == null &&
      (startDate == null || endDate == null);
}
