import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:banking_flutter_app/config/theme/input_theme.dart';

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
  final bool isDarkMode;

  /// * constructor
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  })
    : assert(selectedColor >= 0, 'Selected color must be greater than 0'),
      assert(
        selectedColor < colorList.length,
        'Selected color must be less or equal than ${colorList.length - 1}',
      );

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: const AppBarTheme(centerTitle: false),
    inputDecorationTheme: InputTheme().theme(),
    textTheme: GoogleFonts.robotoTextTheme(),
  );

  // * copyWith returns an instance of AppTheme
  AppTheme copyWith({int? selectedColor, bool? isDarkMode}) => AppTheme(
    selectedColor: selectedColor ?? this.selectedColor,
    isDarkMode: isDarkMode ?? this.isDarkMode,
  );
  // The copyWith is a method used to copy the instance of the “class” and
  // allows to keep the immutable properties of the ‘class’ since when 
  // something changes in the "state" it creates a new state that is 
  // based on the previous one.
}
