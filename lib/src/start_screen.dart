import 'package:flutter/material.dart';

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
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(
                      signUpModel: signUpModel,
                      loginModel: loginModel,
                    ),
                  ),
                ),
                child: Text(
                  SmartLocalize.login,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(
                      signUpModel: signUpModel,
                      loginModel: loginModel,
                    ),
                  ),
                ),
                child: Text(
                  SmartLocalize.signUp,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
