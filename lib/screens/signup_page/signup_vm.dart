import 'package:bai_9a/consts/app_consts.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/database/data_local/shared_pref.dart';
import 'package:bai_9a/ultis/app_validate.dart';
import 'package:bai_9a/widgets/app_toast/app_toast.dart';
import 'package:flutter/material.dart';

class SignupVm extends ChangeNotifier {
  TextEditingController edtName = TextEditingController(text: "dat");
  TextEditingController edtEmail = TextEditingController(text: "dat@gmail.com");
  TextEditingController edtPass = TextEditingController(text: "12345678");
  TextEditingController edtConfirmPass = TextEditingController(text: "12345678");
  bool hintPass = true;
  bool hintConfirmPass = true;

  Future<void> checkSignUp(BuildContext context) async {
    if (edtName.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập Name");
    } else if (edtEmail.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập Email");
    } else if (edtPass.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập Pass");
    } else if (edtConfirmPass.text.trim().isEmpty == true) {
      AppToast.showError("Vui lòng nhập ConfirmPass");
    } else {
      if (AppValidate.validateEmail(edtEmail.text) == false) {
        AppToast.showError("Vui lòng nhập đúng định dạng email");
      } else if (edtPass.text.length < 8) {
        AppToast.showError("Vui lòng nhập từ 8 ký tự đổ lên");
      } else if (edtPass.text != edtConfirmPass.text) {
        AppToast.showError("Confirm pass đang khác pass.\nVui lòng nhập lại");
      } else {
        SharedPref.instance.setString(
          key: AppConsts.keyFullName,
          value: edtName.text,
        );
        SharedPref.instance.setString(
          key: AppConsts.keyEmail,
          value: edtEmail.text,
        );
        SharedPref.instance.setString(
          key: AppConsts.keyPass,
          value: edtPass.text,
        );
        AppToast.showSuccess("Bạn đã tạo tài khoản thành công.");
        Navigator.pushNamed(context, AppRoutePath.login);
      }
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
