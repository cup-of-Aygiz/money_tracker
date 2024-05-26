import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:money_tracker/localization/generated/l10n.dart';

/// Отвечает за локализацию всего приложения
final class Localization extends GeneratedLocalization {
  Localization._({
    required this.locale,
  });

  static const localizationDelegate = _LocalizationDelegate(
    AppLocalizationDelegate(),
  );

  /// Список поддерживаемых языков
  static List<Locale> get supportedLocales =>
      const AppLocalizationDelegate().supportedLocales;

  /// Список делегатов локализации
  /// содержит уже готовые переводы для стандартных компонентов
  static List<LocalizationsDelegate<void>> get localizationDelegates => [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        Localization.localizationDelegate,
      ];

  /// Текущая локализация
  static Localization? get current => _current;

  static Localization? _current;

  /// Текущая локаль
  final Locale locale;

  /// Получение [Localization] из контекста [BuildContext].
  static Localization of(BuildContext context) =>
      Localizations.of<Localization>(context, Localization) ??
      (throw ArgumentError('No Localization found in context'));
}

extension LocalizationX on BuildContext {
  Localization get locale => Localizations.of(this, Localization);
}

final class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate(this._delegate);

  final AppLocalizationDelegate _delegate;

  @override
  bool isSupported(Locale locale) => _delegate.isSupported(locale);

  @override
  Future<Localization> load(Locale locale) =>
      GeneratedLocalization.load(locale).then(
        (value) => Localization._current = Localization._(locale: locale),
      );

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
