import 'package:flutter/material.dart';

import 'colors.dart';

sealed class AppTextStyles {
  static const titleLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );

  static const subtitleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.lightGrey,
  );

  static const boldSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const regularSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const boldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const semiboldMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const boldLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const lightGreyRegular = TextStyle(
    fontSize: 14,
    color: AppColors.lightGrey,
  );

  static const lightGreySmall = TextStyle(
    fontSize: 12,
    color: AppColors.lightGrey,
  );

  static const errorText = TextStyle(
    fontSize: 12,
    color: AppColors.redColor,
  );
}
