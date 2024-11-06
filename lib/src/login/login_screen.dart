import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

import '../../main_auth.dart';
import '../widgets/top_widget.dart';
import 'widgets/bottom_login_widget.dart';

/// A stateless widget that provides a customizable login screen.
/// It allows the integration of various sections such as top, middle,
/// and bottom login widgets, along with customizable title, image,
/// button styles, and login actions.
///
/// The widget also provides toggles for hiding the AppBar or individual
/// sections, and a callback for handling the login action.
class LoginScreen extends StatelessWidget {
  final AuthModel loginModel;
  final AuthModel signUpModel;

  const LoginScreen({
    super.key,
    this.loginModel = const AuthModel(),
    this.signUpModel = const AuthModel(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: loginModel.hideAppBar
          ? null
          : AppBar(
              title: Text(SmartLocalize.login),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: loginModel.padding ?? const EdgeInsets.all(12),
          child: Column(
            children: [
              // Top login section
              if (!loginModel.hideTop) TopWidget(authModel: loginModel),

              // Middle login section
              if (!loginModel.hideMiddle)
                MiddleLoginWidget(loginModel: loginModel),

              // Bottom login section
              if (!loginModel.hideBottom)
                BottomLoginWidget(
                  loginModel: loginModel,
                  signUpModel: signUpModel,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
