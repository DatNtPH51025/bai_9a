import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/screens/splash_page/splash_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashState();
}

class _SplashState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashVm(),
      child: _SplashScreen(),
    );
  }
}

class _SplashScreen extends StatefulWidget {
  @override
  State<_SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<_SplashScreen> {
  late SplashVm splashVm;

  @override
  void initState() {
    super.initState();
    splashVm = context.read<SplashVm>();
    splashVm.initData(context);
  }

  @override
  void dispose() {
    splashVm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgr,
      body: Center(
        child: Image.asset(
          AppImages.img_splash,
          fit: BoxFit.cover,
          height: 75,
        ),
      ),
    );
  }
}
