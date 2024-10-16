import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

class MiddleSignUpWidget extends StatefulWidget {
  final AuthModel signUpModel;

  const MiddleSignUpWidget({super.key, required this.signUpModel});

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
    isConfirmPasswordEmpty = !widget.signUpModel.hideConfirmPasswordField;
    isPhoneEmpty = !widget.signUpModel.hidePhoneField;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.signUpModel.middleWidget ??
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
              if (!widget.signUpModel.hidePhoneField) ...[
                const SizedBox(height: 12),
                MainTextField.phone(
                  favoriteCountryCode: widget.signUpModel.favoriteCountryCode,
                  initialCountryCode: widget.signUpModel.initialCountryCode,
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
              if (!widget.signUpModel.hideConfirmPasswordField) ...[
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
                label: SmartLocalize.signUp,
                isDisable: isFormEmpty,
                isLoading: widget.signUpModel.isLoading,
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    widget.signUpModel.onSignUpPressed?.call(
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
