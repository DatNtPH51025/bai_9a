import 'package:bai_9a/consts/app_consts.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/database/data_local/shared_pref.dart';
import 'package:flutter/material.dart';

class SplashVm extends ChangeNotifier {
  void initData(BuildContext context) {
    Future.delayed(Duration(milliseconds: 2000), () async {
      bool? check = await SharedPref.instance.getBool(AppConsts.keyIntro);
      print(check);
      if (check == true) {
        Navigator.pushNamed(context, AppRoutePath.login);
      } else {
        Navigator.pushNamed(context, AppRoutePath.introPage);
      }
    });
  }
}
