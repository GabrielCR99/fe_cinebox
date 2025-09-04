import 'package:flutter/material.dart';
import 'text_styles.dart';

sealed class AppTheme {
  static ThemeData get theme => ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: AppTextStyles.semiboldMedium,
    ),
  );
}
