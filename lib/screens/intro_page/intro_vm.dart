import 'package:bai_9a/consts/app_consts.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/database/data_local/shared_pref.dart';
import 'package:flutter/material.dart';

class IntroVm extends ChangeNotifier {
  int index = 0;
  PageController controller = PageController();

  void checkNext(BuildContext context) {
    if (index < 2) {
      index++;
      notifyListeners();
      controller.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      SharedPref.instance.setBool(key: AppConsts.keyIntro, value: true);
      Navigator.pushNamed(context, AppRoutePath.login);
    }
  }

  void checkIndex(int value) {
    index = value;
    notifyListeners();
  }
}
