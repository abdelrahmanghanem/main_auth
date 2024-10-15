import 'package:flutter/material.dart';

import '../../../main_auth.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final void Function()? onTap;
  final TextStyle? style;
  const ForgotPasswordWidget({super.key, this.onTap, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onTap,
          child: Text(
            SmartLocalize.forgotPassword,
            style: style ?? Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
