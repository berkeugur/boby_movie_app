// lib/core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static final Color redDark = const Color.fromRGBO(140, 38, 38, 1);
  static final Color redLight = const Color.fromRGBO(203, 44, 44, 1);
  static final Color greyDark = const Color.fromRGBO(150, 141, 141, 1);
  static final Color greyLight = const Color.fromRGBO(222, 213, 213, 1);
  static final Color black = const Color.fromRGBO(15, 14, 14, 1);
  static final Color white = const Color.fromRGBO(243, 233, 233, 1);

  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
    useMaterial3: true,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
      titleMedium: TextStyle(color: Colors.black, fontSize: 18),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        backgroundBuilder: (context, states, child) {
          return Container(
            decoration: BoxDecoration(color: states.isEmpty ? redLight : redDark, borderRadius: BorderRadius.circular(8)),
            child: child,
          );
        },
        surfaceTintColor: WidgetStateProperty.all(redDark),
        overlayColor: WidgetStateProperty.all(redDark),
        backgroundColor: WidgetStateProperty.all(redLight),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      primary: redLight,
      secondary: redDark,
      background: black,
      surface: black,
      onPrimary: white,
      onSecondary: white,
      onBackground: white,
      onSurface: white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),

        surfaceTintColor: WidgetStateProperty.all(redDark),
        overlayColor: WidgetStateProperty.all(redDark),
        foregroundColor: WidgetStateProperty.all(white),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 26),
      titleMedium: TextStyle(color: white, fontSize: 18),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        backgroundBuilder: (context, states, child) {
          return Container(
            decoration: BoxDecoration(color: states.isEmpty ? redLight : redDark, borderRadius: BorderRadius.circular(8)),
            child: child,
          );
        },
        surfaceTintColor: WidgetStateProperty.all(redDark),
        overlayColor: WidgetStateProperty.all(redDark),
        backgroundColor: WidgetStateProperty.all(redLight),
        foregroundColor: WidgetStateProperty.all(white),
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
