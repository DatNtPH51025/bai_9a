import 'package:bai_9a/consts/app_colors.dart';
import 'package:bai_9a/consts/app_path.dart';
import 'package:bai_9a/consts/app_router_path.dart';
import 'package:bai_9a/consts/app_text_style.dart';
import 'package:bai_9a/screens/signup_page/signup_vm.dart';
import 'package:bai_9a/widgets/app_buttons/app_button.dart';
import 'package:bai_9a/widgets/app_text_filed/text_filed_login.dart';
import 'package:bai_9a/widgets/app_titles/app_titles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupVm(),
      child: _SignUpScreen(),
    );
  }
}
class _SignUpScreen extends StatefulWidget {
  @override
  State<_SignUpScreen> createState() => _SignupPageState();
}

class _SignupPageState extends State<_SignUpScreen> {
  late SignupVm signupVm;

  @override
  void initState() {
    super.initState();
    signupVm = context.read<SignupVm>();
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
                    'Sign Up',
                    style: AppTextStyle.textBig.copyWith(
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
                          text: 'Already have an account ? ',
                          style: AppTextStyle.textMedium.copyWith(
                            color: AppColors.cGray,
                          ),
                        ),
                        TextSpan(
                          text: ' Login ',
                          style: AppTextStyle.textMedium,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, AppRoutePath.login);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  textTitleRequire('Full Name'),
                  SizedBox(height: 8),
                  TextFiledLogin(
                    controller: signupVm.edtName,
                    hintText: 'Enter username',
                  ),
                  SizedBox(height: 12),
                  textTitleRequire('Email'),
                  SizedBox(height: 8),
                  TextFiledLogin(
                    controller: signupVm.edtEmail,
                    hintText: 'Enter email',
                  ),
                  SizedBox(height: 12),
                  textTitleRequire('Password'),
                  SizedBox(height: 8),
                  Consumer<SignupVm>(builder: (_, SignupVm logic, child) {
                    return TextFiledLogin(
                      controller: signupVm.edtPass,
                      hintText: 'Enter password',
                      hintPass: logic.hintPass,
                      subFixIc: GestureDetector(
                        onTap: () {
                          setState(() {
                            signupVm.changeHintPassSu();
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            logic.hintPass == true ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 12),
                  textTitleRequire('Confirm Password'),
                  SizedBox(height: 12),
                  Consumer<SignupVm>(builder: (_, SignupVm logic, child) {
                    return TextFiledLogin(
                      controller: signupVm.edtConfirmPass,
                      hintText: 'Enter confirm password',
                      hintPass: logic.hintConfirmPass,
                      subFixIc: GestureDetector(
                        onTap: () {
                          setState(() {
                            signupVm.changeHintConfrimPassSu();
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            logic.hintConfirmPass == true ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
                          ),
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 24),
                  AppButton(
                    paddingH: 0,
                    title: 'Sign Up',
                    onTap: () {
                      signupVm.checkSignUp(context);
                    },
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
