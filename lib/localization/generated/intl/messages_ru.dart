// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(name) => "Лимит по категории \"${name}\" добавлен";

  static String m1(name) => "Лимит по категории \"${name}\" удален";

  static String m2(name) => "Лимит по категории \"${name}\" изменен";

  static String m3(name) => "Транзакция \"${name}\" добавлена";

  static String m4(name) => "Транзакция \"${name}\" изменена";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "added": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addedLimit": MessageLookupByLibrary.simpleMessage("Добавить лимит"),
        "addedTransaction":
            MessageLookupByLibrary.simpleMessage("Добавить операцию"),
        "additionalIncome":
            MessageLookupByLibrary.simpleMessage("Дополнительный доход"),
        "analytics": MessageLookupByLibrary.simpleMessage("Аналитика"),
        "analyticsAllExpenses":
            MessageLookupByLibrary.simpleMessage("Аналитика по всем расходам"),
        "analyticsAllIncomes":
            MessageLookupByLibrary.simpleMessage("Аналитика по всем доходам"),
        "analyticsAllTime":
            MessageLookupByLibrary.simpleMessage("Аналитика за все время"),
        "analyticsWeek":
            MessageLookupByLibrary.simpleMessage("Аналитика за неделю"),
        "analyticsYear":
            MessageLookupByLibrary.simpleMessage("Аналитика за год"),
        "budgetLimits":
            MessageLookupByLibrary.simpleMessage("Бюджетные ограничения"),
        "category": MessageLookupByLibrary.simpleMessage("Категория"),
        "choseCategoryTransaction":
            MessageLookupByLibrary.simpleMessage("Категория операции"),
        "choseDateTransaction":
            MessageLookupByLibrary.simpleMessage("Дата операции"),
        "choseNameTransaction":
            MessageLookupByLibrary.simpleMessage("Название операции"),
        "choseTypeTransaction":
            MessageLookupByLibrary.simpleMessage("Тип операции"),
        "clearFilter": MessageLookupByLibrary.simpleMessage("Очистить фильтр"),
        "clearSearchQuery":
            MessageLookupByLibrary.simpleMessage("Очистить поиск"),
        "complete": MessageLookupByLibrary.simpleMessage("Готово"),
        "currentExpense": MessageLookupByLibrary.simpleMessage("Текущая трата"),
        "delete": MessageLookupByLibrary.simpleMessage("Удалить"),
        "dividendsAndInterest": MessageLookupByLibrary.simpleMessage(
            "Дивиденды и проценты по вкладам"),
        "edit": MessageLookupByLibrary.simpleMessage("Редактировать"),
        "editLimit": MessageLookupByLibrary.simpleMessage("Изменить лимит"),
        "editTransaction":
            MessageLookupByLibrary.simpleMessage("Изменить операцию"),
        "education": MessageLookupByLibrary.simpleMessage("Образование"),
        "endDate": MessageLookupByLibrary.simpleMessage("Конец периода"),
        "entertainment": MessageLookupByLibrary.simpleMessage("Развлечения"),
        "expense": MessageLookupByLibrary.simpleMessage("Расход"),
        "expenses": MessageLookupByLibrary.simpleMessage("Расходы"),
        "food": MessageLookupByLibrary.simpleMessage("Питание"),
        "giftsAndAllowances":
            MessageLookupByLibrary.simpleMessage("Подарки и пособия"),
        "healthAndBeauty":
            MessageLookupByLibrary.simpleMessage("Здоровье и красота"),
        "home": MessageLookupByLibrary.simpleMessage("Главная"),
        "housing": MessageLookupByLibrary.simpleMessage("Жилье"),
        "income": MessageLookupByLibrary.simpleMessage("Доход"),
        "incomes": MessageLookupByLibrary.simpleMessage("Доходы"),
        "limit": MessageLookupByLibrary.simpleMessage("Лимит"),
        "limitAdded": m0,
        "limitAmount": MessageLookupByLibrary.simpleMessage("Сумма лимита"),
        "limitDelete": m1,
        "limitExceeded": MessageLookupByLibrary.simpleMessage("Лимит превышен"),
        "limitUpdated": m2,
        "listTransactionsIsEmpty":
            MessageLookupByLibrary.simpleMessage("Список транзакций пуст"),
        "miscellaneous": MessageLookupByLibrary.simpleMessage("Прочее"),
        "notEnoughAnalyticsData": MessageLookupByLibrary.simpleMessage(
            "Недостаточно данных для аналитики"),
        "requiredField":
            MessageLookupByLibrary.simpleMessage("Обязательное поле"),
        "salary": MessageLookupByLibrary.simpleMessage("Заработная плата"),
        "salesOfAssets": MessageLookupByLibrary.simpleMessage(
            "Продажа имущества или ценных бумаг"),
        "save": MessageLookupByLibrary.simpleMessage("Сохранить"),
        "savingsAndInvestments":
            MessageLookupByLibrary.simpleMessage("Сбережения и инвестиции"),
        "search": MessageLookupByLibrary.simpleMessage("Поиск"),
        "shopping": MessageLookupByLibrary.simpleMessage("Шопинг"),
        "startDate": MessageLookupByLibrary.simpleMessage("Начало периода"),
        "sumTransaction":
            MessageLookupByLibrary.simpleMessage("Сумма операции"),
        "transactionAdded": m3,
        "transactionAmountValid": MessageLookupByLibrary.simpleMessage(
            "Сумма операции должна быть больше 0"),
        "transactionType":
            MessageLookupByLibrary.simpleMessage("Назначении операции"),
        "transactionUpdated": m4,
        "transactionsWithFilterAndSearchClear":
            MessageLookupByLibrary.simpleMessage(
                "По выбранным фильтрам и по данному поисковому запросу ничего не найдено"),
        "transactionsWithFilterClear": MessageLookupByLibrary.simpleMessage(
            "По выбранным фильтрам нет Транзакций"),
        "transactionsWithSearchClear": MessageLookupByLibrary.simpleMessage(
            "По данному поисковому запросу ничего не найдено"),
        "transportation": MessageLookupByLibrary.simpleMessage("Транспорт"),
        "travel": MessageLookupByLibrary.simpleMessage("Путешествия"),
        "youCan": MessageLookupByLibrary.simpleMessage("Вы можете")
      };
}
