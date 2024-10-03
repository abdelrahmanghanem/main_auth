import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:main_button/main_button.dart';

import '../../forget_password/forget_password_screen.dart';
import '../../forget_password/widgets/forgot_password_widget.dart';

enum LoginType {
  email,
  phone,
}

class MiddleLoginWidget extends StatefulWidget {
  final Widget? child;
  final LoginType loginType;
  final void Function(String email, String password)? onLoginPressed;
  const MiddleLoginWidget({
    super.key,
    this.onLoginPressed,
    this.child,
    required this.loginType,
  });

  @override
  State<MiddleLoginWidget> createState() => _MiddleLoginWidgetState();
}

class _MiddleLoginWidgetState extends State<MiddleLoginWidget> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? phone;
  String? password;
  String? countryCode;
  String initialCountryCode = '+20';

  bool isEmailEmpty = true;
  bool isPhoneEmpty = true;
  bool isPasswordEmpty = true;

  bool get isEmailLoginEmpty => isEmailEmpty || isPasswordEmpty;
  bool get isPhoneLoginEmpty => isPhoneEmpty || isPasswordEmpty;
  @override
  Widget build(BuildContext context) {
    return widget.child ??
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getLoginTextFieldType(),
              const SizedBox(height: 12),
              MainTextField.password(
                onChanged: (value) => setState(() {
                  password = value;
                  isPasswordEmpty = value.isEmpty;
                }),
              ),
              ForgotPasswordWidget(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgetPasswordScreen(),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              MainButton(
                label: AuthMessage(key: 'login_').localize(context) ?? 'Login',
                isDisable: widget.loginType == LoginType.email
                    ? isEmailLoginEmpty
                    : isPhoneEmpty,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    getOnLoginPressed();
                  }
                },
              ),
            ],
          ),
        );
  }

  getLoginTextFieldType() {
    switch (widget.loginType) {
      case LoginType.email:
        return MainTextField.email(
          onChanged: (value) => setState(() {
            email = value;
            isEmailEmpty = value.isEmpty;
          }),
        );
      case LoginType.phone:
        return MainTextField.phone(
          initialCountryCode: initialCountryCode,
          onChangedCountryCode: (value) {
            countryCode = value.toString();
          },
          onChanged: (value) => setState(() {
            phone = value;
            isPhoneEmpty = value.isEmpty;
          }),
        );
    }
  }

  getOnLoginPressed() {
    switch (widget.loginType) {
      case LoginType.email:
        return widget.onLoginPressed?.call(email!, password!);
      case LoginType.phone:
        return widget.onLoginPressed
            ?.call('${countryCode ?? initialCountryCode}$phone', password!);
    }
  }
}
