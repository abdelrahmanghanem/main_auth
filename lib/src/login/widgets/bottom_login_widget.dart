import 'package:flutter/material.dart';

import '../../../main_auth.dart';
import '../../widgets/or_widget.dart';
import '../../widgets/social_group_widgets.dart';

class BottomLoginWidget extends StatelessWidget {
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapX;
  final VoidCallback? onTapApple;
  final VoidCallback? onTapFacebook;
  final Widget? child;
  final ButtonSocialType? buttonType;
  final ButtonDecoration? buttonStyle;
  final List<AuthType> authTypesList;

  const BottomLoginWidget({
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    super.key,
    this.child,
    this.buttonType,
    this.buttonStyle,
    required this.authTypesList,
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
              onTapApple: onTapApple,
              onTapGoogle: onTapGoogle,
              onTapX: onTapX,
              onTapFacebook: onTapFacebook,
            ),
          ],
        );
  }
}
