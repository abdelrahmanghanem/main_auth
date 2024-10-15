import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

class MainAuth extends StatelessWidget {
  final AuthModel loginModel;
  final AuthModel signUpModel;
  const MainAuth({
    super.key,
    required this.loginModel,
    required this.signUpModel,
  });

  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      loginModel: loginModel,
      signUpModel: signUpModel,
    );
  }
}
