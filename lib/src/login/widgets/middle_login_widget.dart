import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:main_button/main_button.dart';

import '../../forget_password/forget_password_screen.dart';
import '../../forget_password/widgets/forgot_password_widget.dart';

class MiddleLoginWidget extends StatefulWidget {
  final Widget? child;
  final void Function(String email, String password)? onLoginPressed;
  const MiddleLoginWidget({super.key, this.onLoginPressed, this.child});

  @override
  State<MiddleLoginWidget> createState() => _MiddleLoginWidgetState();
}

class _MiddleLoginWidgetState extends State<MiddleLoginWidget> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  bool get isFormEmpty => isEmailEmpty || isPasswordEmpty;
  @override
  Widget build(BuildContext context) {
    return widget.child ??
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainTextField.email(
                onChanged: (value) => setState(() {
                  email = value;
                  isEmailEmpty = value.isEmpty;
                }),
              ),
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
                isDisable: isFormEmpty,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onLoginPressed?.call(email!, password!);
                  }
                },
              ),
            ],
          ),
        );
  }
}
