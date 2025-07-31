import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static initEnvironment() async {
    await dotenv.load(fileName: '.env');
  }

  static String foo = dotenv.env['FOO'] ?? 'There is no FOO variable';
  static String bar = dotenv.env['BAR'] ?? 'There is no BAR variable';
  static String fooBar = dotenv.env['FOOBAR'] ?? 'There is no FOOBAR variable';
}
