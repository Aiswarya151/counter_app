import 'package:counter_app/core/theme/app_bar_theme.dart';
import 'package:counter_app/core/theme/button_theme.dart';
import 'package:counter_app/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    appBarTheme: AppAppBarTheme.appBarTheme,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    textTheme: AppTextTheme.textTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.blue,
  );
}
