import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AppTheme {
  final bool isDarkMode;

  AppTheme({this.isDarkMode = false});

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff37693d),
      surfaceTint: Color(0xff37693d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffb8f0b8),
      onPrimaryContainer: Color(0xff1e5027),
      secondary: Color(0xff445e91),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffd8e2ff),
      onSecondaryContainer: Color(0xff2b4678),
      tertiary: Color(0xff68548e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffebddff),
      onTertiaryContainer: Color(0xff4f3d74),
      error: Color(0xff904a48),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad8),
      onErrorContainer: Color(0xff733332),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f484a),
      outline: Color(0xff6f797a),
      outlineVariant: Color(0xffbfc8ca),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff9dd49e),
      primaryFixed: Color(0xffb8f0b8),
      onPrimaryFixed: Color(0xff002107),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff1e5027),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a41),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff2b4678),
      tertiaryFixed: Color(0xffebddff),
      onTertiaryFixed: Color(0xff230f46),
      tertiaryFixedDim: Color(0xffd3bcfd),
      onTertiaryFixedVariant: Color(0xff4f3d74),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff9dd49e),
      surfaceTint: Color(0xff9dd49e),
      onPrimary: Color(0xff023913),
      primaryContainer: Color(0xff1e5027),
      onPrimaryContainer: Color(0xffb8f0b8),
      secondary: Color(0xffadc6ff),
      onSecondary: Color(0xff102f60),
      secondaryContainer: Color(0xff2b4678),
      onSecondaryContainer: Color(0xffd8e2ff),
      tertiary: Color(0xffd3bcfd),
      onTertiary: Color(0xff38265c),
      tertiaryContainer: Color(0xff4f3d74),
      onTertiaryContainer: Color(0xffebddff),
      error: Color(0xffffb3af),
      onError: Color(0xff571d1d),
      errorContainer: Color(0xff733332),
      onErrorContainer: Color(0xffffdad8),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffbfc8ca),
      outline: Color(0xff899294),
      outlineVariant: Color(0xff3f484a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff37693d),
      primaryFixed: Color(0xffb8f0b8),
      onPrimaryFixed: Color(0xff002107),
      primaryFixedDim: Color(0xff9dd49e),
      onPrimaryFixedVariant: Color(0xff1e5027),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a41),
      secondaryFixedDim: Color(0xffadc6ff),
      onSecondaryFixedVariant: Color(0xff2b4678),
      tertiaryFixed: Color(0xffebddff),
      onTertiaryFixed: Color(0xff230f46),
      tertiaryFixedDim: Color(0xffd3bcfd),
      onTertiaryFixedVariant: Color(0xff4f3d74),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: GoogleFonts.robotoTextTheme().apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    // textTheme: TextTheme(
    //   titleLarge: GoogleFonts.montserratAlternates(),
    //   titleMedium: GoogleFonts.russoOne(fontSize: 25),
    // ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    appBarTheme: const AppBarTheme(centerTitle: false),
  );

  ThemeData getTheme() => isDarkMode ? dark() : light();

  // The copyWith is a method used to copy the instance of the “class” and
  // allows to keep the immutable properties of the ‘class’ since when
  // something changes in the "state" it creates a new state that is
  // based on the previous one.
  AppTheme copyWith({bool? isDarkMode}) =>
      AppTheme(isDarkMode: isDarkMode ?? this.isDarkMode);
}
