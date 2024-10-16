import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

import 'start_screen.dart';

class MainAuth extends StatelessWidget {
  final bool hiddenStartScreen;
  final AuthModel loginModel;
  final AuthModel signUpModel;
  const MainAuth({
    super.key,
    this.hiddenStartScreen = false,
    required this.loginModel,
    required this.signUpModel,
  });

  @override
  Widget build(BuildContext context) {
    return hiddenStartScreen
        ? LoginScreen(
            loginModel: loginModel,
            signUpModel: signUpModel,
          )
        : StartScreen(
            loginModel: loginModel,
            signUpModel: signUpModel,
          );
  }
}
