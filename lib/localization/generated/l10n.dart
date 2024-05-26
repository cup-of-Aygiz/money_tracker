// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class GeneratedLocalization {
  GeneratedLocalization();

  static GeneratedLocalization? _current;

  static GeneratedLocalization get current {
    assert(_current != null,
        'No instance of GeneratedLocalization was loaded. Try to initialize the GeneratedLocalization delegate before accessing GeneratedLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<GeneratedLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = GeneratedLocalization();
      GeneratedLocalization._current = instance;

      return instance;
    });
  }

  static GeneratedLocalization of(BuildContext context) {
    final instance = GeneratedLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of GeneratedLocalization present in the widget tree. Did you add GeneratedLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static GeneratedLocalization? maybeOf(BuildContext context) {
    return Localizations.of<GeneratedLocalization>(
        context, GeneratedLocalization);
  }

  /// `Добавить операцию`
  String get addedTransaction {
    return Intl.message(
      'Добавить операцию',
      name: 'addedTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Изменить операцию`
  String get editTransaction {
    return Intl.message(
      'Изменить операцию',
      name: 'editTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Сумма операции`
  String get sumTransaction {
    return Intl.message(
      'Сумма операции',
      name: 'sumTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Назначении операции`
  String get transactionType {
    return Intl.message(
      'Назначении операции',
      name: 'transactionType',
      desc: '',
      args: [],
    );
  }

  /// `Название операции`
  String get choseNameTransaction {
    return Intl.message(
      'Название операции',
      name: 'choseNameTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Тип операции`
  String get choseTypeTransaction {
    return Intl.message(
      'Тип операции',
      name: 'choseTypeTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Категория операции`
  String get choseCategoryTransaction {
    return Intl.message(
      'Категория операции',
      name: 'choseCategoryTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Дата операции`
  String get choseDateTransaction {
    return Intl.message(
      'Дата операции',
      name: 'choseDateTransaction',
      desc: '',
      args: [],
    );
  }

  /// `Расход`
  String get expense {
    return Intl.message(
      'Расход',
      name: 'expense',
      desc: '',
      args: [],
    );
  }

  /// `Расходы`
  String get expenses {
    return Intl.message(
      'Расходы',
      name: 'expenses',
      desc: '',
      args: [],
    );
  }

  /// `Доход`
  String get income {
    return Intl.message(
      'Доход',
      name: 'income',
      desc: '',
      args: [],
    );
  }

  /// `Доходы`
  String get incomes {
    return Intl.message(
      'Доходы',
      name: 'incomes',
      desc: '',
      args: [],
    );
  }

  /// `Питание`
  String get food {
    return Intl.message(
      'Питание',
      name: 'food',
      desc: '',
      args: [],
    );
  }

  /// `Развлечения`
  String get entertainment {
    return Intl.message(
      'Развлечения',
      name: 'entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Транспорт`
  String get transportation {
    return Intl.message(
      'Транспорт',
      name: 'transportation',
      desc: '',
      args: [],
    );
  }

  /// `Жилье`
  String get housing {
    return Intl.message(
      'Жилье',
      name: 'housing',
      desc: '',
      args: [],
    );
  }

  /// `Здоровье и красота`
  String get healthAndBeauty {
    return Intl.message(
      'Здоровье и красота',
      name: 'healthAndBeauty',
      desc: '',
      args: [],
    );
  }

  /// `Шопинг`
  String get shopping {
    return Intl.message(
      'Шопинг',
      name: 'shopping',
      desc: '',
      args: [],
    );
  }

  /// `Путешествия`
  String get travel {
    return Intl.message(
      'Путешествия',
      name: 'travel',
      desc: '',
      args: [],
    );
  }

  /// `Образование`
  String get education {
    return Intl.message(
      'Образование',
      name: 'education',
      desc: '',
      args: [],
    );
  }

  /// `Сбережения и инвестиции`
  String get savingsAndInvestments {
    return Intl.message(
      'Сбережения и инвестиции',
      name: 'savingsAndInvestments',
      desc: '',
      args: [],
    );
  }

  /// `Прочее`
  String get miscellaneous {
    return Intl.message(
      'Прочее',
      name: 'miscellaneous',
      desc: '',
      args: [],
    );
  }

  /// `Заработная плата`
  String get salary {
    return Intl.message(
      'Заработная плата',
      name: 'salary',
      desc: '',
      args: [],
    );
  }

  /// `Дополнительный доход`
  String get additionalIncome {
    return Intl.message(
      'Дополнительный доход',
      name: 'additionalIncome',
      desc: '',
      args: [],
    );
  }

  /// `Подарки и пособия`
  String get giftsAndAllowances {
    return Intl.message(
      'Подарки и пособия',
      name: 'giftsAndAllowances',
      desc: '',
      args: [],
    );
  }

  /// `Дивиденды и проценты по вкладам`
  String get dividendsAndInterest {
    return Intl.message(
      'Дивиденды и проценты по вкладам',
      name: 'dividendsAndInterest',
      desc: '',
      args: [],
    );
  }

  /// `Продажа имущества или ценных бумаг`
  String get salesOfAssets {
    return Intl.message(
      'Продажа имущества или ценных бумаг',
      name: 'salesOfAssets',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get added {
    return Intl.message(
      'Добавить',
      name: 'added',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get home {
    return Intl.message(
      'Главная',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика`
  String get analytics {
    return Intl.message(
      'Аналитика',
      name: 'analytics',
      desc: '',
      args: [],
    );
  }

  /// `Готово`
  String get complete {
    return Intl.message(
      'Готово',
      name: 'complete',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Обязательное поле`
  String get requiredField {
    return Intl.message(
      'Обязательное поле',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Сумма операции должна быть больше 0`
  String get transactionAmountValid {
    return Intl.message(
      'Сумма операции должна быть больше 0',
      name: 'transactionAmountValid',
      desc: '',
      args: [],
    );
  }

  /// `Список транзакций пуст`
  String get listTransactionsIsEmpty {
    return Intl.message(
      'Список транзакций пуст',
      name: 'listTransactionsIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Вы можете`
  String get youCan {
    return Intl.message(
      'Вы можете',
      name: 'youCan',
      desc: '',
      args: [],
    );
  }

  /// `По выбранным фильтрам нет Транзакций`
  String get transactionsWithFilterClear {
    return Intl.message(
      'По выбранным фильтрам нет Транзакций',
      name: 'transactionsWithFilterClear',
      desc: '',
      args: [],
    );
  }

  /// `По данному поисковому запросу ничего не найдено`
  String get transactionsWithSearchClear {
    return Intl.message(
      'По данному поисковому запросу ничего не найдено',
      name: 'transactionsWithSearchClear',
      desc: '',
      args: [],
    );
  }

  /// `По выбранным фильтрам и по данному поисковому запросу ничего не найдено`
  String get transactionsWithFilterAndSearchClear {
    return Intl.message(
      'По выбранным фильтрам и по данному поисковому запросу ничего не найдено',
      name: 'transactionsWithFilterAndSearchClear',
      desc: '',
      args: [],
    );
  }

  /// `Очистить фильтр`
  String get clearFilter {
    return Intl.message(
      'Очистить фильтр',
      name: 'clearFilter',
      desc: '',
      args: [],
    );
  }

  /// `Очистить поиск`
  String get clearSearchQuery {
    return Intl.message(
      'Очистить поиск',
      name: 'clearSearchQuery',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Сумма лимита`
  String get limitAmount {
    return Intl.message(
      'Сумма лимита',
      name: 'limitAmount',
      desc: '',
      args: [],
    );
  }

  /// `Добавить лимит`
  String get addedLimit {
    return Intl.message(
      'Добавить лимит',
      name: 'addedLimit',
      desc: '',
      args: [],
    );
  }

  /// `Изменить лимит`
  String get editLimit {
    return Intl.message(
      'Изменить лимит',
      name: 'editLimit',
      desc: '',
      args: [],
    );
  }

  /// `Начало периода`
  String get startDate {
    return Intl.message(
      'Начало периода',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `Конец периода`
  String get endDate {
    return Intl.message(
      'Конец периода',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика за год`
  String get analyticsYear {
    return Intl.message(
      'Аналитика за год',
      name: 'analyticsYear',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика за все время`
  String get analyticsAllTime {
    return Intl.message(
      'Аналитика за все время',
      name: 'analyticsAllTime',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика за неделю`
  String get analyticsWeek {
    return Intl.message(
      'Аналитика за неделю',
      name: 'analyticsWeek',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика по всем расходам`
  String get analyticsAllExpenses {
    return Intl.message(
      'Аналитика по всем расходам',
      name: 'analyticsAllExpenses',
      desc: '',
      args: [],
    );
  }

  /// `Аналитика по всем доходам`
  String get analyticsAllIncomes {
    return Intl.message(
      'Аналитика по всем доходам',
      name: 'analyticsAllIncomes',
      desc: '',
      args: [],
    );
  }

  /// `Бюджетные ограничения`
  String get budgetLimits {
    return Intl.message(
      'Бюджетные ограничения',
      name: 'budgetLimits',
      desc: '',
      args: [],
    );
  }

  /// `Категория`
  String get category {
    return Intl.message(
      'Категория',
      name: 'category',
      desc: '',
      args: [],
    );
  }

  /// `Текущая трата`
  String get currentExpense {
    return Intl.message(
      'Текущая трата',
      name: 'currentExpense',
      desc: '',
      args: [],
    );
  }

  /// `Лимит превышен`
  String get limitExceeded {
    return Intl.message(
      'Лимит превышен',
      name: 'limitExceeded',
      desc: '',
      args: [],
    );
  }

  /// `Лимит`
  String get limit {
    return Intl.message(
      'Лимит',
      name: 'limit',
      desc: '',
      args: [],
    );
  }

  /// `Транзакция "{name}" добавлена`
  String transactionAdded(Object name) {
    return Intl.message(
      'Транзакция "$name" добавлена',
      name: 'transactionAdded',
      desc: '',
      args: [name],
    );
  }

  /// `Транзакция "{name}" изменена`
  String transactionUpdated(Object name) {
    return Intl.message(
      'Транзакция "$name" изменена',
      name: 'transactionUpdated',
      desc: '',
      args: [name],
    );
  }

  /// `Лимит по категории "{name}" добавлен`
  String limitAdded(Object name) {
    return Intl.message(
      'Лимит по категории "$name" добавлен',
      name: 'limitAdded',
      desc: '',
      args: [name],
    );
  }

  /// `Лимит по категории "{name}" изменен`
  String limitUpdated(Object name) {
    return Intl.message(
      'Лимит по категории "$name" изменен',
      name: 'limitUpdated',
      desc: '',
      args: [name],
    );
  }

  /// `Лимит по категории "{name}" удален`
  String limitDelete(Object name) {
    return Intl.message(
      'Лимит по категории "$name" удален',
      name: 'limitDelete',
      desc: '',
      args: [name],
    );
  }

  /// `Недостаточно данных для аналитики`
  String get notEnoughAnalyticsData {
    return Intl.message(
      'Недостаточно данных для аналитики',
      name: 'notEnoughAnalyticsData',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<GeneratedLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<GeneratedLocalization> load(Locale locale) =>
      GeneratedLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
