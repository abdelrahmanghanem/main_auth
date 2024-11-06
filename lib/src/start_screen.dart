import 'package:flutter/material.dart';
import 'package:main_button/main_button.dart';
import 'package:smart_localize/smart_localize.dart';

import '../main_auth.dart';
import 'sign_up/sign_up_screen.dart';

class StartScreen extends StatelessWidget {
  final AuthModel signUpModel;
  final AuthModel loginModel;
  const StartScreen({
    super.key,
    required this.signUpModel,
    required this.loginModel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
            child: Column(
          children: [
            MainButton(
              label: SmartLocalize.login,
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginScreen(
                    signUpModel: signUpModel,
                    loginModel: loginModel,
                  ),
                ),
              ),
            ),
            MainButton(
              label: SmartLocalize.signUp,
              onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => SignUpScreen(
                    signUpModel: signUpModel,
                    loginModel: loginModel,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
