import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:flutter/material.dart';

Widget textTitleRequire(String title) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        title,
        style: AppTextStyle.text12RI.copyWith(
          color: AppColors.cBlack,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      Text(
        ' *',
        style: AppTextStyle.text12RI.copyWith(
          color: AppColors.cError,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget textTitle(String title) {
  return Text(
    title,
    style: AppTextStyle.text12RI.copyWith(
      color: AppColors.cBlack,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );
}
