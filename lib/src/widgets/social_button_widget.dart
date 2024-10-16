import 'package:flutter/material.dart';

import 'svg_social_widget.dart';
import 'text_social_widget.dart';

enum SocialButtonDecoration {
  defaultStyle,
  primaryStyle,
  outlineStyle,
}

enum SocialButtonType {
  defaultType,
  icon,
}

enum SocialAuth {
  google,
  apple,
  x,
  facebook,
}

class SocialButtonWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final double borderRadius;
  final double? width;
  final double? height;
  final Color? iconColor;

  final SocialAuth socialAuth;
  final SocialButtonType? socialButtonType;
  final SocialButtonDecoration? buttonStyle;
  const SocialButtonWidget({
    super.key,
    this.onTap,
    this.borderRadius = 8.0,
    this.width,
    this.height,
    this.iconColor,
    required this.socialAuth,
    this.socialButtonType = SocialButtonType.defaultType,
    this.buttonStyle = SocialButtonDecoration.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width ??
            (socialButtonType == SocialButtonType.icon ? 44 : double.infinity),
        height: height ?? 44,
        // padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: getBackColorAuth(buttonStyle!, socialAuth),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          border: buttonStyle == SocialButtonDecoration.outlineStyle
              ? Border.all(
                  color: Colors.grey.shade300,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: SizedBox(
          child: socialButtonType == SocialButtonType.icon
              ? SvgSocialWidget(
                  iconColor: iconColor,
                  authType: socialAuth,
                  buttonStyle: buttonStyle!,
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgSocialWidget(
                      iconColor: iconColor,
                      authType: socialAuth,
                      buttonStyle: buttonStyle!,
                    ),
                    const SizedBox(width: 10),
                    TextSocialWidget(
                      authType: socialAuth,
                      buttonStyle: buttonStyle!,
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

getBackColorAuth(SocialButtonDecoration buttonStyle, SocialAuth authType) {
  bool isFacebook = authType == SocialAuth.facebook;
  bool isX = authType == SocialAuth.x;
  switch (buttonStyle) {
    case SocialButtonDecoration.defaultStyle:
      return isFacebook
          ? const Color(0xFF1877F2)
          : isX
              ? Colors.black
              : Colors.white;
    case SocialButtonDecoration.primaryStyle:
      return Colors.white;
    case SocialButtonDecoration.outlineStyle:
      return Colors.transparent;
  }
}
