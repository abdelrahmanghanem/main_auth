import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

import '../forget_password/forget_password_screen.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final TextStyle? style;
  const ForgotPasswordWidget({super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ForgetPasswordScreen(),
            ),
          ),
          child: Text(
            SmartLocalize.forgotPassword,
            style: style ?? Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
