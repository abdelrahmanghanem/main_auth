import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../main_auth.dart';
import '../strings.dart';

class SvgSocialWidget extends StatelessWidget {
  final Color? iconColor;
  final AuthType authType;
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

getImageAuth(AuthType authType, ButtonDecoration buttonStyle) {
  switch (authType) {
    case AuthType.google:
      return AppImages.googleIcon;
    case AuthType.apple:
      return AppImages.appleIcon;
    case AuthType.x:
      return buttonStyle == ButtonDecoration.defaultStyle
          ? AppImages.xWhiteIcon
          : AppImages.xIcon;
    case AuthType.facebook:
      return buttonStyle == ButtonDecoration.defaultStyle
          ? AppImages.facebookWhiteIcon
          : AppImages.facebookIcon;
  }
}
