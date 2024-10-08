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
  final List<SocialAuth> socialAuthList;
  final ButtonSocialType? buttonSocialType;
  final ButtonDecoration? buttonStyle;
  final void Function()? onTermsTap;
  final void Function()? onPrivacyTap;
  final bool hideTerms;
  final bool hideSocialAuth;

  const BottomSignUpWidget({
    super.key,
    this.child,
    this.buttonSocialType,
    this.buttonStyle,
    this.onTermsTap,
    this.onPrivacyTap,
    this.hideTerms = false,
    this.hideSocialAuth = false,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    required this.socialAuthList,
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
                  AuthMessage(key: "you_have_an_account").localize(context) ??
                      "You have an account?",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  child: Text(
                    AuthMessage(key: 'login_').localize(context) ?? 'Login',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: height),
            if (!hideSocialAuth) ...[
              const OrWidget(),
              const SizedBox(height: height),
              Text(
                AuthMessage(key: 'enter_with').localize(context) ??
                    'Enter with',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: height),
              SocialGroupWidgets(
                buttonType: buttonSocialType,
                buttonStyle: buttonStyle,
                onTapApple: onTapApple,
                onTapGoogle: onTapGoogle,
                onTapX: onTapX,
                socialAuthList: socialAuthList,
                onTapFacebook: onTapFacebook,
              ),
            ],
            const SizedBox(height: 24),
            if (!hideTerms)
              TermsWidget(
                onTermsTap: onTermsTap,
                onPrivacyTap: onPrivacyTap,
              ),
          ],
        );
  }
}
