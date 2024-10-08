import 'package:flutter/material.dart';

import '../../main_auth.dart';

class TextSocialWidget extends StatelessWidget {
  final SocialAuth authType;
  final ButtonDecoration buttonStyle;
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
      return AuthMessage(key: "sign_in_with_google").localize(context) ??
          "Sign in with Google";
    case SocialAuth.apple:
      return AuthMessage(key: "sign_in_with_apple").localize(context) ??
          "Sign in with Apple";

    case SocialAuth.x:
      return AuthMessage(key: "sign_in_with_x").localize(context) ??
          "Sign in with X";

    case SocialAuth.facebook:
      return AuthMessage(key: "sign_in_with_facebook").localize(context) ??
          "Sign in with Facebook";
  }
}

getTextColorAuth(ButtonDecoration buttonStyle, SocialAuth authType) {
  bool isFacebook = authType == SocialAuth.facebook;
  bool isX = authType == SocialAuth.x;
  switch (buttonStyle) {
    case ButtonDecoration.defaultStyle:
      return isFacebook || isX ? Colors.white : Colors.black;
    case ButtonDecoration.primaryStyle:
    case ButtonDecoration.outlineStyle:
      return Colors.black;
  }
}
