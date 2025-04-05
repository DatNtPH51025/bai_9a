import 'package:bai_9a/consts/app_consts.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/database/data_local/data_global.dart';
import 'package:bai_9a/database/data_local/shared_pref.dart';
import 'package:bai_9a/models/entity/users_profile.dart';
import 'package:bai_9a/ultis/app_validate.dart';
import 'package:bai_9a/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';

class LoginVm extends ChangeNotifier {
  TextEditingController edtEmail = TextEditingController(text: "");
  TextEditingController edtPass = TextEditingController(text: "");
  bool hintPass = true;

  Future<void> checkLogin(BuildContext context) async {
    String? savedFullName =
        await SharedPref.instance.getString(AppConsts.keyFullName);
    String? savedEmail =
        await SharedPref.instance.getString(AppConsts.keyEmail);
    String? savedPass = await SharedPref.instance.getString(AppConsts.keyPass);
    String? savedRole = await SharedPref.instance.getString(AppConsts.keyRole);

    if (edtEmail.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập Email");
    } else if (edtPass.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập Pass");
    } else if (AppValidate.validateEmail(edtEmail.text) == false) {
      AppToast.showError("Vui lòng nhập đúng định dạng email");
    } else if (edtPass.text.length < 8) {
      AppToast.showError("Vui lòng nhập từ 8 ký tự đổ lên");
    } else {
      if (edtEmail.text.trim() == savedEmail &&
          edtPass.text.trim() == savedPass) {
        AppToast.showSuccess("Đăng nhập thành công.");
        DataGlobal.instance.usersProfile = UsersProfile(
          userFullName: savedFullName,
          email: savedEmail,
          passWord: savedPass,
          role: parseRole(savedRole),
        );

        if (parseRole(savedRole) == UserRole.admin) {
          Navigator.pushReplacementNamed(context, AppRoutePath.adminPage);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutePath.mainPage);
        }
      } else {
        AppToast.showError("Email hoặc mật khẩu không chính xác.");
      }
    }
  }

  void changeHintPass() {
    hintPass = !hintPass;
    notifyListeners();
  }
}
