// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

class ForgetPasswordModel {
  final String? emailOrPhone;
  final OTPType otpType;
  final TextStyle? style;
  final Future<void> Function(
      String emailOrPhone, OTPType otpType, VoidCallback? onSuccess)? onSend;
  final Future<void> Function(
          String emailOrPhone, OTPType otpType, VoidCallback? onSuccess)?
      onResendOTP;
  final Future<void> Function(
      String emailOrPhone, String otp, VoidCallback? onSuccess)? onVerify;
  final Future<void> Function(String password, VoidCallback? onSuccess)?
      onResetPassword;
  final bool showEnterAnotherEmail;
  final bool showTries;
  final int maxTries;
  ForgetPasswordModel({
    this.emailOrPhone,
    required this.otpType,
    this.style,
    required this.onSend,
    required this.onVerify,
    required this.onResendOTP,
    required this.onResetPassword,
    this.showEnterAnotherEmail = false,
    this.showTries = false,
    this.maxTries = 3,
  });
  ForgetPasswordModel.empty({
    this.emailOrPhone,
    this.otpType = OTPType.email,
    this.style,
    this.onSend,
    this.onResendOTP,
    this.onVerify,
    this.onResetPassword,
    this.showEnterAnotherEmail = false,
    this.showTries = false,
    this.maxTries = 3,
  });

  ForgetPasswordModel copyWith({
    String? emailOrPhone,
  }) {
    return ForgetPasswordModel(
      emailOrPhone: emailOrPhone ?? this.emailOrPhone,
      otpType: otpType,
      style: style,
      onSend: onSend,
      onResendOTP: onResendOTP,
      onVerify: onVerify,
      onResetPassword: onResetPassword,
    );
  }
}
