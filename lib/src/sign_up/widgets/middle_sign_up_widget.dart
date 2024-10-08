import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:main_button/main_button.dart';

class MiddleSignUpWidget extends StatefulWidget {
  final Widget? child;
  final bool hideConfirmPasswordField;
  final bool hidePhoneField;
  final String initialCountryCode;
  final List<String> favoriteCountryCode;
  final bool isSignUpLoading;
  final void Function(String email, String password,
      {String? phone, String? confirmPassword})? onSignUpPressed;
  const MiddleSignUpWidget({
    super.key,
    this.onSignUpPressed,
    this.child,
    this.isSignUpLoading = false,
    required this.hideConfirmPasswordField,
    required this.hidePhoneField,
    required this.initialCountryCode,
    required this.favoriteCountryCode,
  });

  @override
  State<MiddleSignUpWidget> createState() => _MiddleSignUpWidgetState();
}

class _MiddleSignUpWidgetState extends State<MiddleSignUpWidget> {
  late bool isConfirmPasswordEmpty;
  late bool isPhoneEmpty;
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? phone;
  String? password;
  String? confirmPassword;
  bool isEmailEmpty = true;
  bool isPasswordEmpty = true;
  bool get isFormEmpty =>
      isEmailEmpty || isPhoneEmpty || isPasswordEmpty || isConfirmPasswordEmpty;
  @override
  void initState() {
    isConfirmPasswordEmpty = !widget.hideConfirmPasswordField;
    isPhoneEmpty = !widget.hidePhoneField;
    super.initState();
  }

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
              if (!widget.hidePhoneField) ...[
                const SizedBox(height: 12),
                MainTextField.phone(
                  favoriteCountryCode: widget.favoriteCountryCode,
                  initialCountryCode: widget.initialCountryCode,
                  onChanged: (value) => setState(() {
                    phone = value;
                    isPhoneEmpty = value.isEmpty;
                  }),
                ),
              ],
              const SizedBox(height: 12),
              MainTextField.password(
                onChanged: (value) => setState(() {
                  password = value;
                  isPasswordEmpty = value.isEmpty;
                }),
              ),
              if (!widget.hideConfirmPasswordField) ...[
                const SizedBox(height: 12),
                MainTextField.confirmPassword(
                  passwordValue: password,
                  onChanged: (value) => setState(() {
                    confirmPassword = value;
                    isConfirmPasswordEmpty = value.isEmpty;
                  }),
                ),
              ],
              const SizedBox(height: 24),
              MainButton(
                label:
                    AuthMessage(key: 'sign_up').localize(context) ?? 'Sign up',
                isDisable: isFormEmpty,
                isLoading: widget.isSignUpLoading,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.onSignUpPressed?.call(
                      email!,
                      password!,
                      phone: phone,
                      confirmPassword: confirmPassword,
                    );
                  }
                },
              ),
            ],
          ),
        );
  }
}
