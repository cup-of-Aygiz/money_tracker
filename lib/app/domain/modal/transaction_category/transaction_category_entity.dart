import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_tracker/app/assets/generated/assets.gen.dart';
import 'package:money_tracker/localization/localization.dart';

part 'transaction_category_entity.freezed.dart';

part 'transaction_category_entity.g.dart';

@freezed
class TransactionCategoryEntity with _$TransactionCategoryEntity {
  const factory TransactionCategoryEntity({
    required String key,

    /// сумма трат по категории
    @Default(0) double amount,

    /// ограничение по категории
    @Default(0) double limitAmount,
  }) = _TransactionCategoryEntity;

  factory TransactionCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryEntityFromJson(json);

  /// Питание
  static const food = TransactionCategoryEntity(key: 'food');

  /// Развлечения
  static const entertainment = TransactionCategoryEntity(key: 'entertainment');

  /// Транспорт
  static const transportation =
      TransactionCategoryEntity(key: 'transportation');

  /// Жилье
  static const housing = TransactionCategoryEntity(key: 'housing');

  /// Здоровье и красота
  static const healthAndBeauty =
      TransactionCategoryEntity(key: 'health_and_beauty');

  /// Шопинг
  static const shopping = TransactionCategoryEntity(key: 'shopping');

  /// Путешествия
  static const travel = TransactionCategoryEntity(key: 'travel');

  /// Образование
  static const education = TransactionCategoryEntity(key: 'education');

  /// Сбережения и инвестиции
  static const savingsAndInvestments =
      TransactionCategoryEntity(key: 'savings_and_investments');

  /// Заработная плата
  static const salary = TransactionCategoryEntity(key: 'salary');

  /// Дополнительный доход
  static const additionalIncome =
      TransactionCategoryEntity(key: 'additional_income');

  /// Подарки и пособия
  static const giftsAndAllowances =
      TransactionCategoryEntity(key: 'gifts_and_allowances');

  /// Дивиденды и проценты по вкладам
  static const dividendsAndInterest =
      TransactionCategoryEntity(key: 'dividends_and_interest');

  /// Продажа имущества или ценных бумаг
  static const salesOfAssets =
      TransactionCategoryEntity(key: 'sales_of_assets');

  /// Прочие расходы
  static const miscellaneous = TransactionCategoryEntity(key: 'miscellaneous');

  /// Получить список всех расходных категорий
  static List<TransactionCategoryEntity> get expenseCategories => [
        TransactionCategoryEntity.food,
        TransactionCategoryEntity.entertainment,
        TransactionCategoryEntity.transportation,
        TransactionCategoryEntity.housing,
        TransactionCategoryEntity.healthAndBeauty,
        TransactionCategoryEntity.shopping,
        TransactionCategoryEntity.travel,
        TransactionCategoryEntity.education,
        TransactionCategoryEntity.savingsAndInvestments,
        TransactionCategoryEntity.miscellaneous,
      ];

  /// Получить список всех категорий доходов
  static List<TransactionCategoryEntity> get incomeCategories => [
        TransactionCategoryEntity.salary,
        TransactionCategoryEntity.additionalIncome,
        TransactionCategoryEntity.giftsAndAllowances,
        TransactionCategoryEntity.dividendsAndInterest,
        TransactionCategoryEntity.salesOfAssets,
        TransactionCategoryEntity.miscellaneous,
      ];
}

extension TransactionCategoryExtension on TransactionCategoryEntity {
  /// Получить название категорий с учетом локализации
  String nameForUser(BuildContext context) {
    switch (key) {
      case 'food':
        return context.locale.food;
      case 'entertainment':
        return context.locale.entertainment;
      case 'transportation':
        return context.locale.transportation;
      case 'housing':
        return context.locale.housing;
      case 'health_and_beauty':
        return context.locale.healthAndBeauty;
      case 'shopping':
        return context.locale.shopping;
      case 'travel':
        return context.locale.travel;
      case 'education':
        return context.locale.education;
      case 'savings_and_investments':
        return context.locale.savingsAndInvestments;
      case 'miscellaneous':
        return context.locale.miscellaneous;
      case 'salary':
        return context.locale.salary;
      case 'additional_income':
        return context.locale.additionalIncome;
      case 'gifts_and_allowances':
        return context.locale.giftsAndAllowances;
      case 'dividends_and_interest':
        return context.locale.dividendsAndInterest;
      case 'sales_of_assets':
        return context.locale.salesOfAssets;
      default:
        return '';
    }
  }

  Color getColorForCategory() {
    switch (key) {
      case 'food':
        return const Color(0xFFF48FB1);
      case 'entertainment':
        return const Color(0xFF81D4FA);
      case 'transportation':
        return const Color(0xFFC5CAE9);
      case 'housing':
        return const Color(0xFFB39DDB);
      case 'health_and_beauty':
        return const Color(0xFFE6EE9C);
      case 'shopping':
        return const Color(0xFFFFAB91);
      case 'travel':
        return const Color(0xFFA5D6A7);
      case 'education':
        return const Color(0xFFB0BEC5);
      case 'savings_and_investments':
        return const Color(0xFFCFD8DC);
      case 'miscellaneous':
        return const Color(0xFFE0E0E0);
      case 'salary':
        return const Color(0xFF4DB6AC);
      case 'additional_income':
        return const Color(0xFF9575CD);
      case 'gifts_and_allowances':
        return const Color(0xFFE57373);
      case 'dividends_and_interest':
        return const Color(0xFF7986CB);
      case 'sales_of_assets':
        return const Color(0xFFFFD54F);
      default:
        return const Color(0xFF000000);
    }
  }

  Widget getIconForCategory({double size = 24}) {
    switch (key) {
      case 'food':
        return Assets.icons.transactionCategory.food
            .svg(height: size, width: size);
      case 'entertainment':
        return Assets.icons.transactionCategory.entertainment
            .svg(height: size, width: size);
      case 'transportation':
        return Assets.icons.transactionCategory.transportation
            .svg(height: size, width: size);
      case 'housing':
        return Assets.icons.transactionCategory.housing
            .svg(height: size, width: size);
      case 'health_and_beauty':
        return Assets.icons.transactionCategory.healthAndBeauty
            .svg(height: size, width: size);
      case 'shopping':
        return Assets.icons.transactionCategory.shopping
            .svg(height: size, width: size);
      case 'travel':
        return Assets.icons.transactionCategory.travel
            .svg(height: size, width: size);
      case 'education':
        return Assets.icons.transactionCategory.education
            .svg(height: size, width: size);
      case 'savings_and_investments':
        return Assets.icons.transactionCategory.savingsAndInvestments
            .svg(height: size, width: size);
      case 'miscellaneous':
        return Assets.icons.transactionCategory.miscellaneous
            .svg(height: size, width: size);
      case 'salary':
        return Assets.icons.transactionCategory.salary
            .svg(height: size, width: size);
      case 'additional_income':
        return Assets.icons.transactionCategory.additionalIncome
            .svg(height: size, width: size);
      case 'gifts_and_allowances':
        return Assets.icons.transactionCategory.giftsAndAllowances
            .svg(height: size, width: size);
      case 'dividends_and_interest':
        return Assets.icons.transactionCategory.dividendsAndInterest
            .svg(height: size, width: size);
      case 'sales_of_assets':
        return Assets.icons.transactionCategory.salesOfAssets
            .svg(height: size, width: size);
      default:
        return Icon(Icons.error, size: size);
    }
  }
}
