import 'package:flutter/material.dart';

import '../../../main_auth.dart';
import '../../widgets/or_widget.dart';
import '../../widgets/social_group_widgets.dart';
import 'terms_widget.dart';

class BottomSignUpWidget extends StatelessWidget {
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapX;
  final VoidCallback? onTapApple;
  final VoidCallback? onTapFacebook;
  final Widget? child;
  final List<AuthType> authTypesList;
  final ButtonSocialType? buttonSocialType;
  final ButtonDecoration? buttonStyle;
  final void Function()? onTermsTap;
  final bool hideTerms;

  const BottomSignUpWidget({
    super.key,
    this.child,
    this.buttonSocialType,
    this.buttonStyle,
    this.onTermsTap,
    this.hideTerms = false,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    this.authTypesList = const [
      AuthType.google,
      AuthType.x,
      AuthType.apple,
      AuthType.facebook,
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
              buttonType: buttonSocialType,
              buttonStyle: buttonStyle,
              onTapApple: onTapApple,
              onTapGoogle: onTapGoogle,
              onTapX: onTapX,
              listAuthType: authTypesList,
              onTapFacebook: onTapFacebook,
            ),
            TermsWidget(
              onTermsTap: onTermsTap,
              hideTerms: hideTerms,
            ),
          ],
        );
  }
}
