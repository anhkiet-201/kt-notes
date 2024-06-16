import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData _themeData(ColorScheme colorScheme, bool isLightTheme) {
    final theme = ThemeData(
      useMaterial3: true,
      textTheme: GoogleFonts.rubikTextTheme().apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      colorScheme: colorScheme,
      brightness: isLightTheme ? Brightness.light : Brightness.dark,
    );
    return theme.copyWith(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
    );
  }

  static ThemeData light(ColorScheme? dynamicColorScheme) {
    final colorScheme = dynamicColorScheme ??
        ColorScheme.fromSeed(
          seedColor: Colors.white,
          surface: const Color(0xffFAFAFF),
          onSurface: const Color(0xff070417),
          surfaceContainer: Colors.white,
        );
    return _themeData(colorScheme, true);
  }

  static ThemeData dark(ColorScheme? dynamicColorScheme) {
    final colorScheme = dynamicColorScheme ??
        ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color(0xff131314),
          surface: const Color(0xff070417),
          onSurface: Colors.white,
          surfaceContainer: const Color(0xff292639),
        );
    return _themeData(colorScheme, false);
  }
}
