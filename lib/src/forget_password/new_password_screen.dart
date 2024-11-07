import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:main_button/main_button.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:smart_localize/smart_localize.dart';

class NewPasswordScreen extends StatefulWidget {
  final ForgetPasswordModel forgetPasswordModel;
  const NewPasswordScreen({super.key, required this.forgetPasswordModel});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool isEmptyPassword = true;
  bool isEmptyConfirmPassword = true;
  String? password;
  String? confirmPassword;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartLocalize.changePassword),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTextField.password(
                            textInputAction: TextInputAction.next,
                            title: SmartLocalize.newPassword,
                            style: Theme.of(context).textTheme.labelSmall,
                            onChanged: (String? value) {
                              setState(() {
                                password = value;
                                isEmptyPassword = (password?.isEmpty ?? true);
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          MainTextField.confirmPassword(
                            passwordValue: password,
                            style: Theme.of(context).textTheme.labelSmall,
                            title: SmartLocalize.reTypeNewPassword,
                            textInputAction: TextInputAction.done,
                            onChanged: (String? value) {
                              setState(
                                () {
                                  confirmPassword = value;
                                  isEmptyConfirmPassword =
                                      confirmPassword?.isEmpty ?? true;
                                },
                              );
                            },
                            initialValue: confirmPassword,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Divider(height: 32),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: MainButton(
                      showShadow: false,
                      disableColor: const Color(0xffE7E7E7),
                      isDisable: isAnyFieldEmpty,
                      isLoading: isLoading,
                      label: SmartLocalize.createNewPassword,
                      onPressed: onResetPassword,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onResetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => isLoading = true);
      widget.forgetPasswordModel.onResetPassword?.call(
        password!,
        () {
          setState(() => isLoading = false);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
      );
      if (mounted) setState(() => isLoading = true);
    }
  }

  bool get isAnyFieldEmpty {
    if (isEmptyPassword || isEmptyConfirmPassword) {
      return true;
    }
    return false;
  }
}
