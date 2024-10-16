import 'package:flutter/material.dart';

import '../../../main_auth.dart';
import '../../widgets/or_widget.dart';
import '../../widgets/social_group_widgets.dart';

class BottomSignUpWidget extends StatelessWidget {
  final AuthModel signUpModel;
  final AuthModel loginModel;

  const BottomSignUpWidget({
    super.key,
    required this.signUpModel,
    required this.loginModel,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 12.0;
    return signUpModel.bottomWidget ??
        Column(
          children: [
            const SizedBox(height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  SmartLocalize.youHaveAnAccount,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(
                        signUpModel: signUpModel,
                        loginModel: loginModel,
                      ),
                    ),
                  ),
                  child: Text(
                    SmartLocalize.login,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: height),
            if (!signUpModel.socialModel.hideSocialAuth) ...[
              const OrWidget(),
              const SizedBox(height: height),
              Text(
                SmartLocalize.enterWith,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: height),
              SocialGroupWidgets(socialModel: signUpModel.socialModel),
            ],
            const SizedBox(height: 24),
            if (!signUpModel.hideTerms)
              TermsWidget(
                onTermsTap: signUpModel.onTermsTap,
                onPrivacyTap: signUpModel.onPrivacyTap,
              ),
          ],
        );
  }
}
