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
  final String initialCountryCode;
  final List<String> favoriteCountryCode;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? phoneValidator;
  final void Function(String email, String password)? onLoginPressed;
  const MiddleLoginWidget({
    super.key,
    this.onLoginPressed,
    this.child,
    required this.loginType,
    required this.initialCountryCode,
    required this.favoriteCountryCode,
    this.emailValidator,
    this.passwordValidator,
    this.phoneValidator,
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
                validator: widget.passwordValidator,
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
                isDisable: getDisable(),
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

  bool getDisable() {
    switch (widget.loginType) {
      case LoginType.email:
        return isEmailLoginEmpty;
      case LoginType.phone:
        return isPhoneLoginEmpty;
    }
  }

  MainTextField getLoginTextFieldType() {
    switch (widget.loginType) {
      case LoginType.email:
        return MainTextField.email(
          validator: widget.emailValidator,
          onChanged: (value) => setState(() {
            email = value;
            isEmailEmpty = value.isEmpty;
          }),
        );
      case LoginType.phone:
        return MainTextField.phone(
          validator: widget.phoneValidator,
          initialCountryCode: widget.initialCountryCode,
          favoriteCountryCode: widget.favoriteCountryCode,
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
        return widget.onLoginPressed?.call(
            '${countryCode ?? widget.initialCountryCode}$phone', password!);
    }
  }
}
