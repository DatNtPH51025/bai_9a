import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final double? paddingH;

  AppButton({
    required this.onTap,
    this.title,
    this.paddingH,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 52,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: paddingH ?? 16),
        decoration: BoxDecoration(
          color: AppColors.cBlack,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title ?? 'Next',
            style: AppTextStyle.text16SB.copyWith(
              color: AppColors.bgr,
            ),
          ),
        ),
      ),
    );
  }
}
