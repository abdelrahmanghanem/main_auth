import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

import '../forget_password/forget_password_screen.dart';
import '../models/forget_password_model.dart';

export 'package:main_auth/src/models/forget_password_model.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final ForgetPasswordModel forgetPasswordModel;
  const ForgotPasswordWidget({super.key, required this.forgetPasswordModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ForgetPasswordScreen(
                forgetPasswordModel: forgetPasswordModel,
              ),
            ),
          ),
          child: Text(
            SmartLocalize.forgotPassword,
            style: forgetPasswordModel.style ??
                Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
          ),
        ),
      ],
    );
  }
}

enum OTPType { email, phone }
