import 'package:flutter/material.dart';

import '../../main_auth.dart';
import 'widgets/bottom_login_widget.dart';
import 'widgets/middle_login_widget.dart';
import 'widgets/top_login_widget.dart';

class LoginScreen extends StatelessWidget {
  final bool hideAppBar;
  final String? title;
  final Widget? image;
  final ButtonSocialType buttonSocialType;
  final ButtonDecoration buttonStyle;
  final TextStyle? titleStyle;
  final bool hideTopLogin;
  final Widget? topLoginWidget;
  final bool hideMiddleLogin;
  final Widget? middleLoginWidget;
  final bool hideBottomLogin;
  final Widget? bottomLoginWidget;
  final EdgeInsets? padding;
  final void Function(String email, String password)? onLoginPressed;

  const LoginScreen({
    super.key,
    this.title,
    this.image,
    this.titleStyle,
    this.hideAppBar = false,
    this.hideTopLogin = false,
    this.topLoginWidget,
    this.hideMiddleLogin = false,
    this.middleLoginWidget,
    this.hideBottomLogin = false,
    this.bottomLoginWidget,
    this.padding,
    this.onLoginPressed,
    this.buttonSocialType = ButtonSocialType.defaultType,
    this.buttonStyle = ButtonDecoration.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
              title: Text(
                AuthMessage(key: 'login_').localize(context) ?? 'Login',
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding ?? const EdgeInsets.all(12),
          child: Column(
            children: [
              if (!hideTopLogin)
                TopLoginWidget(
                  title: title,
                  titleStyle: titleStyle,
                  image: image,
                  child: topLoginWidget,
                ),
              if (!hideMiddleLogin)
                MiddleLoginWidget(
                  onLoginPressed: onLoginPressed,
                  child: middleLoginWidget,
                ),
              if (!hideBottomLogin)
                BottomLoginWidget(
                  buttonType: buttonSocialType,
                  buttonStyle: buttonStyle,
                  child: bottomLoginWidget,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
