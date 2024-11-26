import 'package:bai_9a/consts/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  static String _fontAvertaBold = "AvertaBold";
  static String _fontAvertaLight = "AvertaLight";
  static String _fontAvertaThin = "AvertaThin";

  static TextStyle textSmall = TextStyle(
    fontFamily: _fontAvertaThin,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: AppColors.cYanPrimary,
  );

  static TextStyle textMedium = TextStyle(
    fontFamily: _fontAvertaLight,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
    color: AppColors.cYanPrimary,
  );

  static TextStyle textBig = TextStyle(
    fontFamily: _fontAvertaBold,
    fontSize: 24,
    fontWeight: FontWeight.w500,
    height: 36 / 24,
    color: AppColors.cYanPrimary,
  );
}
