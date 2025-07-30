import 'package:intl/intl.dart';

class HumanFormats {
  static String number( double number, [ decimals = 0 ] ) {
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: decimals,
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
