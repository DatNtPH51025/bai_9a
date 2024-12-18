import 'package:bai_9a/consts/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  // static String _fontAvertaBold = "AvertaBold";
  // static String _fontAvertaLight = "AvertaLight";
  // static String _fontAvertaThin = "AvertaThin";
  /// R = w400
  /// M = w500
  /// SB = w600
  /// B = w700
  static TextStyle text12R = TextStyle(
    //fontFamily: _fontAvertaThin,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.txtCBlack,
  );
  static TextStyle text12RI = TextStyle(
    // chu nghieng
    //fontFamily: _fontAvertaThin,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
    color: AppColors.txtCBlack,
    fontStyle: FontStyle.italic,
  );
  static TextStyle text12M = TextStyle(
    //fontFamily: _fontAvertaThin,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
    color: AppColors.txtCBlack,
  );
  static TextStyle text12SB = TextStyle(
    //fontFamily: _fontAvertaThin,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    color: AppColors.txtCBlack,
  );

  static TextStyle text16R = TextStyle(
    //fontFamily: _fontAvertaLight,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 24 / 16,
    color: AppColors.txtCBlack,
  );

  static TextStyle text16SB = TextStyle(
    //fontFamily: _fontAvertaThin,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
    color: AppColors.txtCBlack,
  );

  static TextStyle text24R = TextStyle(
    // fontFamily: _fontAvertaBold,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    height: 36 / 24,
    color: AppColors.txtCBlack,
  );
}
