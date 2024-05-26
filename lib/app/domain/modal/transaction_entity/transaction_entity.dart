import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/app/domain/modal/transaction_category/transaction_category_entity.dart';
import 'package:money_tracker/localization/localization.dart';
import 'package:money_tracker/uikit/uikit.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

part 'transaction_entity.freezed.dart';

part 'transaction_entity.g.dart';

@JsonEnum(valueField: 'type')
enum TransactionType {
  @JsonValue('expense')
  expense,
  @JsonValue('income')
  income;
}

@freezed
class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    required String id,
    required String name,
    required double amount,
    required TransactionType type,
    required TransactionCategoryEntity category,
    required DateTime date,
  }) = _TransactionEntity;

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);
}

extension TransactionEntityExtension on TransactionEntity {
  String amountForUser() {
    final CurrencyTextInputFormatter formatter = FormatString.formatter;
    switch (type) {
      case TransactionType.expense:
        return '- ${formatter.formatString(amount.toStringAsFixed(2))} ₽';
      case TransactionType.income:
        return '+ ${formatter.formatString(amount.toStringAsFixed(2))} ₽';
    }
  }

  int compareToByDate(TransactionEntity other) {
    return date.compareTo(other.date);
  }
}

extension TransactionTypeExtension on TransactionType {
  String nameForUser(BuildContext context) {
    switch (this) {
      case TransactionType.expense:
        return context.locale.expense;
      case TransactionType.income:
        return context.locale.income;
    }
  }

  Color getColorForType() {
    switch (this) {
      case TransactionType.expense:
        return AppColors.white;
      case TransactionType.income:
        return AppColors.green;
    }
  }
}
