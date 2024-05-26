import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

extension StringUtils on String {
  /// округление копеек до двух знаков
  /// и добавлении 0 при отсуствии
  /// 1.999 => 1.99
  String get roundStringToTwoDecimals {
    // Разделяем строку на целую и дробную части
    List<String> parts = split(',');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : '';

    // Оставляем только два символа после разделителя
    if (decimalPart.length > 2) {
      decimalPart = decimalPart.substring(0, 2);
    }

    // Возвращаем строку с округленной дробной частью
    return '$integerPart,${decimalPart.padRight(2, '0')}';
  }
}

class FormatString {
  /// Преобразует сумму в формат "60 000,00 ₽"
  static String amountForUser(double amount, {bool needPennies = false}) {
    final String formattedString =
        formatter.formatString(amount.toStringAsFixed(2));
    return '${needPennies ? formattedString : formattedString.substring(0, formattedString.length - 3)} ₽';
  }

  static final CurrencyTextInputFormatter formatter =
      CurrencyTextInputFormatter.currency(symbol: '', locale: 'ru');
}
