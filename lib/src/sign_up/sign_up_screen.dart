import 'package:flutter/material.dart';
import 'package:main_auth/src/sign_up/widgets/bottom_sign_up_widget.dart';
import 'package:main_auth/src/sign_up/widgets/middle_sign_up_widget.dart';

import '../../main_auth.dart';
import '../widgets/top_widget.dart';

class SignUpScreen extends StatelessWidget {
  final AuthModel loginModel;
  final AuthModel signUpModel;

  const SignUpScreen({
    super.key,
    this.loginModel = const AuthModel(),
    this.signUpModel = const AuthModel(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: signUpModel.hideAppBar
          ? null
          : AppBar(
              title: Text(SmartLocalize.signUp),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: signUpModel.padding ??
              const EdgeInsets.all(12), // Default padding if not specified
          child: Column(
            children: [
              // Top sign-up section
              if (!signUpModel.hideTop) TopWidget(authModel: signUpModel),

              // Middle sign-up section
              if (!signUpModel.hideMiddle)
                MiddleSignUpWidget(signUpModel: signUpModel),

              // Bottom sign-up section
              if (!signUpModel.hideBottom)
                BottomSignUpWidget(
                  signUpModel: signUpModel,
                  loginModel: loginModel,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
