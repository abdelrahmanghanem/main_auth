import 'package:flutter/material.dart';
import 'package:main_button/main_button.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:smart_localize/smart_localize.dart';

import '../widgets/forgot_password_widget.dart';
import 'otp_verification_screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final ForgetPasswordModel forgetPasswordModel;
  const ForgetPasswordScreen({super.key, required this.forgetPasswordModel});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isEmptyEmailOrPhone = true;
  String? emailOrPhone;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final maxWidth = widget.forgetPasswordModel.maxWidth ?? 370;
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartLocalize.forgotPassword),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SizedBox(
              width: maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SmartLocalize.enterEmailToResetPassword,
                    style: widget.forgetPasswordModel.titleStyle ??
                        Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: 16),
                  Form(
                    key: _formKey,
                    child: widget.forgetPasswordModel.otpType == OTPType.phone
                        ? MainTextField.phone(
                            maxWidth: maxWidth,
                            hideAsterisk: true,
                            titleStyle: Theme.of(context).textTheme.labelSmall,
                            onChanged: (value) {
                              setState(() {
                                isEmptyEmailOrPhone = value.isEmpty;
                                emailOrPhone = value;
                              });
                            },
                          )
                        : MainTextField.email(
                            maxWidth: maxWidth,
                            hideAsterisk: true,
                            titleStyle: Theme.of(context).textTheme.labelSmall,
                            validator: (_) => null,
                            onChanged: (value) {
                              setState(() {
                                isEmptyEmailOrPhone = value.isEmpty;
                                emailOrPhone = value;
                              });
                            },
                          ),
                  ),
                  SizedBox(height: 24),
                  MainButton(
                    maxWidth: maxWidth,
                    label: SmartLocalize.sendOtp,
                    isDisable: isEmptyEmailOrPhone,
                    showShadow: false,
                    disableColor: const Color(0xffE7E7E7),
                    isLoading: isLoading,
                    onPressed: onSend,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onSend() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => isLoading = true);
      await widget.forgetPasswordModel.onSend?.call(
        emailOrPhone!,
        widget.forgetPasswordModel.otpType,
        (token) {
          setState(() => isLoading = false);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(
                forgetPasswordModel: widget.forgetPasswordModel.copyWith(
                  emailOrPhone: emailOrPhone,
                  token: token,
                ),
              ),
            ),
          );
        },
      );
      if (mounted) setState(() => isLoading = false);
    }
  }
}
