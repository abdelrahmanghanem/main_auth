import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';

class TopWidget extends StatelessWidget {
  final AuthModel authModel;

  const TopWidget({super.key, required this.authModel});

  @override
  Widget build(BuildContext context) {
    return authModel.topWidget ??
        Column(
          children: [
            if (authModel.image != null) authModel.image!,
            if (authModel.image != null) const SizedBox(height: 20),
            Text(
              authModel.title ?? 'Welcome',
              style: const TextStyle(color: Colors.black, fontSize: 30),
              // style: titleStyle ?? Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24)
          ],
        );
  }
}
