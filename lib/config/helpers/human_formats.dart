import 'package:intl/intl.dart';

class HumanFormats {
  static String number(double number) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en',
    ).format(number);

    return formattedNumber;
  }

  static String formattedNumber(
    double number, {
    String? locale,
    String? name,
    String? symbol,
    int? decimalDigits,
  }) {
    return NumberFormat.compactCurrency(
      name: name ?? '',
      locale: locale ?? 'en',
      symbol: symbol ?? '',
      decimalDigits: decimalDigits ?? 0,
    ).format(number);
  }
}
