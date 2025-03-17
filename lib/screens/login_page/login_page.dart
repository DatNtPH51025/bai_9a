import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:bai_9a/screens/login_page/login_vm.dart';
import 'package:bai_9a/widgets/app_buttons/app_button.dart';
import 'package:bai_9a/widgets/app_text_filed/text_filed_login.dart';
import 'package:bai_9a/widgets/app_titles/app_titles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginVm(),
      child: _LoginScreen(),
    );
  }
}

/// khởi tạo class con

class _LoginScreen extends StatefulWidget {
  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
  late LoginVm loginVm;

  @override
  void initState() {
    /// khởi tạo viết dưới state
    super.initState();

    ///code vào đây
    loginVm = context.read<LoginVm>();

    /// lấy ra logic đã được khỏi tạo dòng 25
  }

  @override
  void dispose() {
    ///hủy viết trên
    ///chèn code vaof đây
    ///không dùng notifyListeners() sau khi gọi dispose()
    loginVm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgr,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.img_logo_intro,
                    fit: BoxFit.fitHeight,
                    height: 32,
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Login',
                    style: AppTextStyle.text16SB.copyWith(
                      color: AppColors.cBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      text: '',
                      children: [
                        TextSpan(
                          text: 'Don’t have an account ? ',
                          style: AppTextStyle.text12RI.copyWith(
                            color: AppColors.cGray,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: AppTextStyle.text12RI,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                  context, AppRoutePath.signUpOne);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  textTitleRequire('Email'),
                  SizedBox(height: 8),
                  TextFiledLogin(
                    controller: loginVm.edtEmail,
                    hintText: 'Enter email',
                  ),
                  SizedBox(height: 12),
                  textTitleRequire('Password'),
                  SizedBox(height: 8),
                  Consumer<LoginVm>(
                    builder: (_, LoginVm logic, child) {
                      return TextFiledLogin(
                        controller: loginVm.edtPass,
                        hintText: 'Enter password',
                        hintPass: logic.hintPass,
                        subFixIc: GestureDetector(
                          onTap: () {
                            loginVm.changeHintPass();
                          },
                          child: Container(
                            height: 60,
                            width: 55,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Icon(
                              logic.hintPass == true
                                  ? Icons.remove_red_eye_outlined
                                  : Icons.remove_red_eye,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password? ',
                        style: AppTextStyle.text12RI.copyWith(
                          color: AppColors.cGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  AppButton(
                    paddingH: 0,
                    title: 'Login',
                    onTap: () {
                      loginVm.checkLogin(context);
                    },
                  ),
                  SizedBox(height: 38),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Login with Google',
                        style: TextStyle(
                            fontSize: 14,
                            color: AppColors.cBlack,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: SvgPicture.asset(AppImages.ic_google_login),
                      ),
                    ],
                  ),
                  SizedBox(height: 150),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By login , you agree to our',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms & Conditions.',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
