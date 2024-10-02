import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../main_auth.dart';
import '../../widgets/or_widget.dart';
import '../../widgets/social_group_widgets.dart';

class BottomLoginWidget extends StatelessWidget {
  final Widget? child;
  final ButtonSocialType? buttonType;
  final ButtonDecoration? buttonStyle;
  final List<AuthType> authTypesList;

  const BottomLoginWidget({
    super.key,
    this.child,
    this.buttonType,
    this.buttonStyle,
    this.authTypesList = const [
      AuthType.apple,
      AuthType.google,
      AuthType.x,
      AuthType.facebook
    ],
  });

  @override
  Widget build(BuildContext context) {
    const double height = 12.0;
    return child ??
        Column(
          children: [
            const SizedBox(height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AuthMessage(key: "don't_have_an_account").localize(context) ??
                      "Don't have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  ),
                  child: Text(
                    AuthMessage(key: 'sign_up').localize(context) ?? 'Sign up',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: height),
            const OrWidget(),
            const SizedBox(height: height),
            Text(
              AuthMessage(key: 'enter_with').localize(context) ?? 'Enter with',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: height),
            SocialGroupWidgets(
              buttonType: buttonType,
              buttonStyle: buttonStyle,
              listAuthType: authTypesList,
              onTapApple: () => log('onTapApple'),
              onTapGoogle: () => log('onTapGoogle'),
              onTapX: () => log('onTapX'),
              onTapFacebook: () => log('onTapFacebook'),
            ),
          ],
        );
  }
}
