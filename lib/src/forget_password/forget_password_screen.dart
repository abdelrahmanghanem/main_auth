import 'package:flutter/material.dart';
import 'package:main_button/main_button.dart';

import '../../main_auth.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AuthMessage(key: 'forget_password_').localize(context) ??
              'Forget Password',
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                AuthMessage(key: 'forget_password_').localize(context) ??
                    'Forget Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              MainTextField.email(
                onChanged: (value) {},
              ),
              const SizedBox(height: 12),
              MainButton(label: 'on send', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
