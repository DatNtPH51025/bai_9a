import 'package:bai_9a/consts/app_consts.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/database/data_local/shared_pref.dart';
import 'package:bai_9a/models/entity/users_profile.dart';
import 'package:bai_9a/ultis/app_validate.dart';
import 'package:bai_9a/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';

class SignupVm extends ChangeNotifier {
  TextEditingController edtName = TextEditingController(text: "");
  TextEditingController edtEmail = TextEditingController(text: "");
  TextEditingController edtPass = TextEditingController(text: "");
  TextEditingController edtConfirmPass = TextEditingController(text: "");

  bool hintPass = true;
  bool hintConfirmPass = true;

  UserRole selectedRole = UserRole.user;

  void setRole(UserRole role) {
    selectedRole = role;
    notifyListeners();
  }

  Future<void> checkSignUp(BuildContext context) async {
    if (edtName.text.trim().isEmpty) {
      AppToast.showError("Vui lòng nhập Name");
    } else if (edtEmail.text.trim().isEmpty) {
      AppToast.showError("Vui lòng nhập Email");
    } else if (edtPass.text.trim().isEmpty) {
      AppToast.showError("Vui lòng nhập Pass");
    } else if (edtConfirmPass.text.trim().isEmpty) {
      AppToast.showError("Vui lòng nhập ConfirmPass");
    } else if (!AppValidate.validateEmail(edtEmail.text)) {
      AppToast.showError("Vui lòng nhập đúng định dạng email");
    } else if (edtPass.text.length < 8) {
      AppToast.showError("Vui lòng nhập từ 8 ký tự đổ lên");
    } else if (edtPass.text != edtConfirmPass.text) {
      AppToast.showError("Confirm pass đang khác pass.\nVui lòng nhập lại");
    } else {
      await SharedPref.instance.setString(
        key: AppConsts.keyFullName,
        value: edtName.text,
      );
      await SharedPref.instance.setString(
        key: AppConsts.keyEmail,
        value: edtEmail.text,
      );
      await SharedPref.instance.setString(
        key: AppConsts.keyPass,
        value: edtPass.text,
      );
      await SharedPref.instance.setString(
        key: AppConsts.keyRole,
        value: roleToString(selectedRole), // 👈 convert enum về string
      );

      AppToast.showSuccess("Bạn đã tạo tài khoản thành công.");
      Navigator.pushNamed(context, AppRoutePath.login);
    }
  }

  void changeHintPassSu() {
    hintPass = !hintPass;
    notifyListeners();
  }

  void changeHintConfrimPassSu() {
    hintConfirmPass = !hintConfirmPass;
    notifyListeners();
  }
}
