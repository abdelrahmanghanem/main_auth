// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

typedef OnSend = Future<void> Function(
  String emailOrPhone,
  OTPType otpType,
  void Function(String token)? onSuccess,
);
typedef OnResendOTP = Future<void> Function(
  String emailOrPhone,
  OTPType otpType,
  String token,
  VoidCallback? onSuccess,
);
typedef OnVerify = Future<void> Function(
  String emailOrPhone,
  String otp,
  String token,
  VoidCallback? onSuccess,
);

typedef OnResetPassword = Future<void> Function(
  String email,
  String password,
  String token,
  VoidCallback? onSuccess,
);

class ForgetPasswordModel {
  final String? emailOrPhone;
  final double? maxWidth;
  final OTPType otpType;
  final TextStyle? style;
  final TextStyle? titleStyle;
  final String? token;
  final int otpLength;
  final OnSend? onSend;
  final OnResendOTP? onResendOTP;
  final OnVerify? onVerify;
  final OnResetPassword? onResetPassword;
  final bool showEnterAnotherEmail;
  final bool showTries;
  final int maxTries;
  final AlignmentDirectional screenAlignment;

  ForgetPasswordModel({
    this.emailOrPhone,
    this.maxWidth = 370,
    required this.otpType,
    this.style,
    this.titleStyle,
    this.token,
    required this.onSend,
    required this.onVerify,
    required this.onResendOTP,
    required this.onResetPassword,
    this.showEnterAnotherEmail = false,
    this.showTries = false,
    this.maxTries = 3,
    this.otpLength = 6,
    this.screenAlignment = AlignmentDirectional.topStart,
  });
  ForgetPasswordModel.empty({
    this.titleStyle,
    this.emailOrPhone,
    this.maxWidth = 370,
    this.otpType = OTPType.email,
    this.token,
    this.style,
    this.onSend,
    this.onResendOTP,
    this.onVerify,
    this.onResetPassword,
    this.showEnterAnotherEmail = false,
    this.showTries = false,
    this.maxTries = 3,
    this.otpLength = 6,
    this.screenAlignment = AlignmentDirectional.topStart,
  });

  ForgetPasswordModel copyWith({
    String? emailOrPhone,
    String? token,
  }) {
    return ForgetPasswordModel(
      maxWidth: maxWidth,
      emailOrPhone: emailOrPhone ?? this.emailOrPhone,
      token: token ?? this.token,
      otpType: otpType,
      style: style,
      onSend: onSend,
      onResendOTP: onResendOTP,
      onVerify: onVerify,
      onResetPassword: onResetPassword,
      showEnterAnotherEmail: showEnterAnotherEmail,
      showTries: showTries,
      maxTries: maxTries,
      titleStyle: titleStyle,
      otpLength: otpLength,
      screenAlignment: screenAlignment,
    );
  }
}
