import 'package:flutter/material.dart';

import '../../main_auth.dart';

class TextSocialWidget extends StatelessWidget {
  final SocialAuth authType;
  final SocialButtonDecoration buttonStyle;
  const TextSocialWidget({
    super.key,
    required this.authType,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      getNameAuth(authType: authType, context: context),
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: getTextColorAuth(buttonStyle, authType),
          ),
    );
  }
}

getNameAuth({required SocialAuth authType, required BuildContext context}) {
  switch (authType) {
    case SocialAuth.google:
      return SmartLocalize.signInWithGoogle;
    case SocialAuth.apple:
      return SmartLocalize.signInWithApple;

    case SocialAuth.x:
      return SmartLocalize.signInWithX;

    case SocialAuth.facebook:
      return SmartLocalize.signInWithFacebook;
  }
}

getTextColorAuth(SocialButtonDecoration buttonStyle, SocialAuth authType) {
  bool isFacebook = authType == SocialAuth.facebook;
  bool isX = authType == SocialAuth.x;
  switch (buttonStyle) {
    case SocialButtonDecoration.defaultStyle:
      return isFacebook || isX ? Colors.white : Colors.black;
    case SocialButtonDecoration.primaryStyle:
    case SocialButtonDecoration.outlineStyle:
      return Colors.black;
  }
}
