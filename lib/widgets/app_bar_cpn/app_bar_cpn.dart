import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:flutter/material.dart';

class AppBarCpn extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize = const Size.fromHeight(52);
  final String title;
  final bool? centerTitle;
  final double? elevation;
  final double? leadingW;
  final Widget? leading;
  final Widget? actions;
  final VoidCallback? onBack;
  final Color? bgrColor;

  AppBarCpn({
    Key? key,
    required this.title,
    this.leading,
    this.leadingW,
    this.centerTitle = false,
    this.actions,
    this.elevation,
    this.onBack,
    this.bgrColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgrColor ?? AppColors.white,
      elevation: elevation ?? 0.15,
      titleSpacing: 0,
      centerTitle: false,
      leadingWidth: leadingW ?? 48,
      leading: leading ??
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.transparent,
              child: Icon(Icons.arrow_back),
            ),
          ),
      title: Text(
        title,
        style: AppTextStyle.text12RI.copyWith(
          color: AppColors.cBlack,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        actions ?? SizedBox(),
      ],
    );
  }
}
