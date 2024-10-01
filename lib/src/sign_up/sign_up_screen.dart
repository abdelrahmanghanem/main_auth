import 'package:flutter/material.dart';
import 'package:main_auth/src/sign_up/widgets/bottom_sign_up_widget.dart';
import 'package:main_auth/src/sign_up/widgets/middle_sign_up_widget.dart';

import '../../main_auth.dart';
import 'widgets/top_sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  final bool hideAppBar;
  final String? title;
  final Widget? image;
  final ButtonSocialType buttonSocialType;
  final ButtonDecoration buttonStyle;
  final TextStyle? titleStyle;
  final bool hideTopSignUp;
  final Widget? topSignUpWidget;
  final bool hideMiddleSignUp;
  final Widget? middleSignUpWidget;
  final bool hideBottomSignUp;
  final bool hideConfirmPasswordField;
  final bool hidePhoneField;
  final Widget? bottomSignUpWidget;
  final EdgeInsets? padding;
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapX;
  final VoidCallback? onTapApple;
  final VoidCallback? onTapFacebook;
  final void Function()? onTermsTap;
  final void Function(String email, String password,
      {String? phone, String? confirmPassword})? onSignUpPressed;

  const SignUpScreen({
    super.key,
    this.title,
    this.buttonSocialType = ButtonSocialType.defaultType,
    this.buttonStyle = ButtonDecoration.defaultStyle,
    this.image,
    this.titleStyle,
    this.hideAppBar = false,
    this.hideTopSignUp = false,
    this.topSignUpWidget,
    this.hideMiddleSignUp = false,
    this.middleSignUpWidget,
    this.hideBottomSignUp = false,
    this.hideConfirmPasswordField = false,
    this.hidePhoneField = false,
    this.bottomSignUpWidget,
    this.padding,
    this.onSignUpPressed,
    this.onTermsTap,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
              title: Text(
                AuthMessage(key: 'sign_up').localize(context) ?? 'Sign up',
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding ?? const EdgeInsets.all(12),
          child: Column(
            children: [
              if (!hideTopSignUp)
                TopSignUpWidget(
                  title: title,
                  titleStyle: titleStyle,
                  image: image,
                  child: topSignUpWidget,
                ),
              if (!hideMiddleSignUp)
                MiddleSignUpWidget(
                  hideConfirmPasswordField: hideConfirmPasswordField,
                  hidePhoneField: hidePhoneField,
                  onSignUpPressed: onSignUpPressed,
                  child: middleSignUpWidget,
                ),
              if (!hideBottomSignUp)
                BottomSignUpWidget(
                  onTapFacebook: onTapFacebook,
                  onTapApple: onTapApple,
                  onTapGoogle: onTapGoogle,
                  onTapX: onTapX,
                  buttonStyle: buttonStyle,

                  buttonSocialType: buttonSocialType,
                  onTermsTap: onTermsTap,
                  child: bottomSignUpWidget,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
