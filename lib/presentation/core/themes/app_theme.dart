import 'package:banking_flutter_app/presentation/core/themes/input_theme.dart';
import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;

  /// * constructor
  AppTheme({this.selectedColor = 0})
    : assert(selectedColor >= 0,
      'Selected color must be greater than 0'),
      assert(selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}'
      );

  ThemeData getTheme() =>
      ThemeData(
        useMaterial3: true,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false
        ),
        inputDecorationTheme: InputTheme().theme(),
      );
}
