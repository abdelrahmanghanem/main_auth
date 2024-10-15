import 'package:flutter/material.dart';

import '../../main_auth.dart';

class AuthModel {
  final bool hideAppBar;
  final String? title;
  final TextStyle? titleStyle;
  final Widget? image;
  final EdgeInsets? padding;
  final bool hideTop;
  final Widget? topWidget;
  final bool hideMiddle;
  final Widget? middleWidget;
  final bool hideBottom;
  final Widget? bottomWidget;
  final String initialCountryCode;
  final List<String> favoriteCountryCode;
  final SocialModel socialModel;

  final bool isLoading;

  /// Determines whether to hide the confirm password field in sign-up.
  final bool hideConfirmPasswordField;

  /// Determines whether to hide the phone field in sign-up.
  final bool hidePhoneField;

  /// Callback when the sign-up button is pressed.
  final void Function(
    String email,
    String password, {
    String? phone,
    String? confirmPassword,
  })? onSignUpPressed;

  /// Callback when the terms are tapped.
  final VoidCallback? onTermsTap;

  /// Callback when the privacy policy is tapped.
  final VoidCallback? onPrivacyTap;

  /// Determines whether to hide the terms and conditions section.
  final bool hideTerms;

  /// Callback when the login button is pressed.
  final void Function(String email, String password)? onLoginPressed;

  /// The type of login method to use.
  final LoginType loginType;

  /// Validator for the email field in login.
  final String? Function(String?)? emailValidator;

  /// Validator for the password field in login.
  final String? Function(String?)? passwordValidator;

  /// Validator for the phone field in login (if applicable).
  final String? Function(String?)? phoneValidator;

  /// Constructor for AuthModel.
  const AuthModel({
    // Common properties
    this.titleStyle,
    this.padding,
    this.isLoading = false,

    // Sign-Up specific properties
    this.hideTop = false,
    this.hideBottom = false,
    this.hideConfirmPasswordField = false,
    this.hidePhoneField = false,
    this.onSignUpPressed,
    this.onTermsTap,
    this.onPrivacyTap,
    this.hideTerms = false,
    this.socialModel = const SocialModel(),

    // Login specific properties
    this.topWidget,
    this.hideMiddle = false,
    this.middleWidget,
    this.bottomWidget,
    this.onLoginPressed,
    this.loginType = LoginType.email,
    this.emailValidator,
    this.passwordValidator,
    this.phoneValidator,
    this.hideAppBar = false,
    this.title,
    this.image,
    this.initialCountryCode = '+20',
    this.favoriteCountryCode = const [
      '+20',
      '+966',
    ],
  });
}
