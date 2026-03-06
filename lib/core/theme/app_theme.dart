import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF007AFF);

  static ThemeData light() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.light),
      );

  static ThemeData dark() => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark),
      );
}
