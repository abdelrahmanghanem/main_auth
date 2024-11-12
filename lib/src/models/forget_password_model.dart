// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

class ForgetPasswordModel {
  final String? emailOrPhone;
  final OTPType otpType;
  final TextStyle? style;
  final String? token;
  final int otpLength;

  final Future<void> Function(
    String emailOrPhone,
    OTPType otpType,
    void Function(String token)? onSuccess,
  )? onSend;

  final Future<void> Function(
    String emailOrPhone,
    OTPType otpType,
    String token,
    VoidCallback? onSuccess,
  )? onResendOTP;

  final Future<void> Function(
    String emailOrPhone,
    String otp,
    String token,
    VoidCallback? onSuccess,
  )? onVerify;

  final Future<void> Function(
    String email,
    String password,
    String token,
    VoidCallback? onSuccess,
  )? onResetPassword;

  final bool showEnterAnotherEmail;
  final bool showTries;
  final int maxTries;
  ForgetPasswordModel({
    this.emailOrPhone,
    required this.otpType,
    this.style,
    this.token,
    required this.onSend,
    required this.onVerify,
    required this.onResendOTP,
    required this.onResetPassword,
    this.showEnterAnotherEmail = false,
    this.showTries = false,
    this.maxTries = 3,
    this.otpLength = 6,
  });
  ForgetPasswordModel.empty({
    this.emailOrPhone,
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
  });

  ForgetPasswordModel copyWith({
    String? emailOrPhone,
    String? token,
  }) {
    return ForgetPasswordModel(
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
      otpLength: otpLength,
    );
  }
}
