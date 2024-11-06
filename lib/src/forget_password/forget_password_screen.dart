import 'package:flutter/material.dart';
import 'package:main_button/main_button.dart';
import 'package:main_text_field/main_text_field.dart';
import 'package:smart_localize/smart_localize.dart';

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
