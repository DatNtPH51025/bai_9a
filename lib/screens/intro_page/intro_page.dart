import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_dimentions.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:bai_9a/screens/intro_page/intro_vm.dart';
import 'package:bai_9a/widgets/app_buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroState();
}

class _IntroState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IntroVm(),
      child: _IntroScreen(),
    );
  }
}

class _IntroScreen extends StatefulWidget {
  @override
  State<_IntroScreen> createState() => _IntroPageState();
}

class _IntroPageState extends State<_IntroScreen> {
  late IntroVm introVm;

  @override
  void initState() {
    super.initState();
    introVm = context.read<IntroVm>();
  }

  @override
  void dispose() {
    introVm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgr,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                children: [
                  buildItemPage(
                    title: 'Explore a wide range of\nproducts',
                    subTitle:
                        'Explore a wide range of products at your\nfingertips. QuickMart offers an extensive\ncollection to suit your needs.',
                    img: AppImages.img_intro_1,
                  ),
                  buildItemPage(
                    title: 'Unlock exclusive offers\nand discounts',
                    subTitle:
                        'Get access to limited-time deals and special promotions available only to our valued customers.',
                    img: AppImages.img_intro_2,
                  ),
                  buildItemPage(
                    title: 'Safe and secure payments',
                    subTitle:
                        ' QuickMart employs industry-leading encryption and trusted payment gateways to safeguard your financial information.',
                    img: AppImages.img_intro_3,
                  ),
                ],
                scrollDirection: Axis.horizontal,
                controller: introVm.controller,
                onPageChanged: (value) {
                  introVm.checkIndex(value);
                },
              ),
            ),
            buildButton(),
            SizedBox(height: 24),
            buildDot(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget buildItemPage({
    required String title,
    required String subTitle,
    required String img,
  }) {
    return Column(
      children: [
        buildHeader(img),
        SizedBox(height: 24),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: AppTextStyle.textSmall.copyWith(
              color: AppColors.cBlack,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            subTitle,
            style: AppTextStyle.textMedium.copyWith(
              color: AppColors.cGray,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }

  Widget buildButton() {
    return AppButton(
      title: 'Next',
      onTap: () {
        introVm.checkNext(context);
      },
    );
  }

  Widget buildDot() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.cYan_50,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildItemDot(0),
          SizedBox(width: 4),
          buildItemDot(1),
          SizedBox(width: 4),
          buildItemDot(2),
        ],
      ),
    );
  }

  Widget buildItemDot(int indexItem) {
    return Consumer<IntroVm>(builder: (_, IntroVm logic, child) {
      return Container(
        width: 6,
        height: 6,
        decoration: BoxDecoration(
          color: logic.index == indexItem ? AppColors.cYanPrimary : AppColors.cGray,
          shape: BoxShape.circle,
        ),
      );
    });
  }

  Widget buildHeader(String img) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.cYan,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          children: [
            Consumer<IntroVm>(builder: (_, IntroVm logic, child) {
              return Row(
                children: [
                  logic.index == 0
                      ? Image.asset(
                          AppImages.img_logo_intro,
                          fit: BoxFit.fitHeight,
                          height: 32,
                        )
                      : Image.asset(
                          AppImages.ic_back,
                          fit: BoxFit.fitHeight,
                          height: 32,
                        ),
                  Spacer(),
                  logic.index == 2
                      ? SizedBox()
                      : Text(
                          'Skip for now',
                          style: AppTextStyle.textMedium,
                        ),
                ],
              );
            }),
            SizedBox(height: getHeight(context) * 0.08),
            Expanded(
              child: Image.asset(
                img,
                fit: BoxFit.cover,
                width: getWidth(context) * 0.6,
                height: getWidth(context) * 0.6,
              ),
            ),
            SizedBox(height: getHeight(context) * 0.08),
          ],
        ),
      ),
    );
  }
}
