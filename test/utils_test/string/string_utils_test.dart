import 'package:flutter_test/flutter_test.dart';
import 'package:money_tracker/utils/string/string_utils.dart';

void main() {
  group('Проверка roundStringToTwoDecimals', () {
    test('Проверка 1,999', () {
      expect('1,99', '1,999'.roundStringToTwoDecimals);
    });

    test('Проверка 199,999', () {
      expect('199,99', '199,999'.roundStringToTwoDecimals);
    });
    test('Проверка 1,122', () {
      expect('1,12', '1,122'.roundStringToTwoDecimals);
    });
    test('Проверка 0', () {
      expect('0,00', '0'.roundStringToTwoDecimals);
    });
    test('Проверка 1,00', () {
      expect('1,00', '1,00'.roundStringToTwoDecimals);
    });
    test('Проверка 1,000', () {
      expect('1,00', '1,000'.roundStringToTwoDecimals);
    });
    test('Проверка 222', () {
      expect('222,00', '222'.roundStringToTwoDecimals);
    });
  });
}
