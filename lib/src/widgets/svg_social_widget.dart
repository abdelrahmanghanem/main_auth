import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main_auth.dart';
import '../strings.dart';

class SvgSocialWidget extends StatelessWidget {
  final Color? iconColor;
  final SocialAuth authType;
  final ButtonDecoration buttonStyle;
  const SvgSocialWidget({
    super.key,
    this.iconColor,
    required this.authType,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      getImageAuth(authType, buttonStyle),
      colorFilter: iconColor != null
          ? ColorFilter.mode(
              iconColor!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}

getImageAuth(SocialAuth authType, ButtonDecoration buttonStyle) {
  switch (authType) {
    case SocialAuth.google:
      return AppImages.googleIcon;
    case SocialAuth.apple:
      return AppImages.appleIcon;
    case SocialAuth.x:
      return buttonStyle == ButtonDecoration.defaultStyle
          ? AppImages.xWhiteIcon
          : AppImages.xIcon;
    case SocialAuth.facebook:
      return buttonStyle == ButtonDecoration.defaultStyle
          ? AppImages.facebookWhiteIcon
          : AppImages.facebookIcon;
  }
}
