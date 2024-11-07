import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:main_button/main_button.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:smart_localize/smart_localize.dart';

enum LoginType {
  email,
  phone,
}

class MiddleLoginWidget extends StatefulWidget {
  final AuthModel loginModel;
  final ForgetPasswordModel? forgetPasswordModel;

  const MiddleLoginWidget({
    super.key,
    required this.loginModel,
    this.forgetPasswordModel,
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

  bool getDisable() {
    switch (widget.loginModel.loginType) {
      case LoginType.email:
        return isEmailLoginEmpty;
      case LoginType.phone:
        return isPhoneLoginEmpty;
    }
  }

  MainTextField getLoginTextFieldType({required LoginType loginType}) {
    switch (loginType) {
      case LoginType.email:
        return MainTextField.email(
          validator: widget.loginModel.emailValidator,
          onChanged: (value) => setState(() {
            email = value;
            isEmailEmpty = value.isEmpty;
          }),
        );
      case LoginType.phone:
        return MainTextField.phone(
          validator: widget.loginModel.phoneValidator,
          initialCountryCode: widget.loginModel.initialCountryCode,
          favoriteCountryCode: widget.loginModel.favoriteCountryCode,
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
    switch (widget.loginModel.loginType) {
      case LoginType.email:
        return widget.loginModel.onPressed?.call(email!, password!, null, null);
      case LoginType.phone:
        return widget.loginModel.onPressed?.call(
            '${countryCode ?? widget.loginModel.initialCountryCode}$phone',
            password!,
            null,
            null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.loginModel.middleWidget ??
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(SmartLocalize.about),
              getLoginTextFieldType(loginType: widget.loginModel.loginType),
              const SizedBox(height: 12),
              MainTextField.password(
                validator: widget.loginModel.passwordValidator,
                onChanged: (value) => setState(() {
                  password = value;
                  isPasswordEmpty = value.isEmpty;
                }),
              ),
              ForgotPasswordWidget(
                forgetPasswordModel:
                    widget.forgetPasswordModel ?? ForgetPasswordModel.empty(),
              ),
              const SizedBox(height: 24),
              MainButton(
                label: SmartLocalize.login,
                isLoading: widget.loginModel.isLoading,
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
}
