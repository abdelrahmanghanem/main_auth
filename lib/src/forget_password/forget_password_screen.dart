import 'package:flutter/material.dart';

import '../../main_auth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartLocalize.forgotPassword),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              MainTextField.email(
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              MainButton(
                label: SmartLocalize.send,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
