import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dayTheme = ThemeData(
      backgroundColor: Colors.white70,
      secondaryHeaderColor: Color(0xFF03091c),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFF03091c),
          onPrimary: Color(0xFF03091c),
          secondary: Colors.grey,
          onSecondary: Colors.grey,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.white70,
          onBackground: Colors.white70,
          surface: Colors.white,
          onSurface: Colors.white,
          tertiary: Colors.black54)
  );
  static ThemeData nightTheme = ThemeData(
    backgroundColor: Color(0xFF03091c),
    secondaryHeaderColor: Colors.white,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.blueGrey,
          onSecondary: Colors.blueGrey,
          error: Colors.red,
          onError: Colors.red,
          background: Color(0xFF03091c),
          onBackground: Color(0xFF03091c),
          surface: Colors.black,
          onSurface: Colors.black,
          tertiary: Colors.white54)
  );
}
