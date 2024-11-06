import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

import '../../../main_auth.dart';
import '../../sign_up/sign_up_screen.dart';

class BottomLoginWidget extends StatelessWidget {
  final AuthModel loginModel;
  final AuthModel signUpModel;

  const BottomLoginWidget({
    super.key,
    required this.loginModel,
    required this.signUpModel,
  });

  @override
  Widget build(BuildContext context) {
    const double height = 12.0;
    return loginModel.bottomWidget ??
        Column(
          children: [
            const SizedBox(height: height),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  SmartLocalize.dontHaveAnAccount,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(
                        signUpModel: signUpModel,
                        loginModel: loginModel,
                      ),
                    ),
                  ),
                  child: Text(
                    SmartLocalize.signUp,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: height),
            if (!loginModel.socialModel.hideSocialAuth) ...[
              const OrWidget(),
              const SizedBox(height: height),
              Text(
                SmartLocalize.enterWith,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: height),
              SocialGroupWidgets(socialModel: loginModel.socialModel),
            ]
          ],
        );
  }
}
