import 'package:flutter/material.dart';

import 'svg_social_widget.dart';
import 'text_social_widget.dart';

enum ButtonDecoration {
  defaultStyle,
  primaryStyle,
  outlineStyle,
}

enum ButtonSocialType {
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
  final Widget? icon;
  final SocialAuth authType;
  final ButtonSocialType? buttonType;
  final ButtonDecoration? buttonStyle;
  const SocialButtonWidget({
    super.key,
    this.onTap,
    this.borderRadius = 8.0,
    this.width,
    this.height,
    this.iconColor,
    this.icon,
    required this.authType,
    this.buttonType = ButtonSocialType.defaultType,
    this.buttonStyle = ButtonDecoration.defaultStyle,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width ??
            (buttonType == ButtonSocialType.icon ? 44 : double.infinity),
        height: height ?? 44,
        // padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: getBackColorAuth(buttonStyle!, authType),
          boxShadow: const [
            BoxShadow(
              color: Color(0x0C000000),
              blurRadius: 12,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
          border: buttonStyle == ButtonDecoration.outlineStyle
              ? Border.all(
                  color: Colors.grey.shade300,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        alignment: Alignment.center,
        child: icon ??
            SizedBox(
              child: buttonType == ButtonSocialType.icon
                  ? SvgSocialWidget(
                      iconColor: iconColor,
                      authType: authType,
                      buttonStyle: buttonStyle!,
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgSocialWidget(
                          iconColor: iconColor,
                          authType: authType,
                          buttonStyle: buttonStyle!,
                        ),
                        const SizedBox(width: 10),
                        TextSocialWidget(
                          authType: authType,
                          buttonStyle: buttonStyle!,
                        )
                      ],
                    ),
            ),
      ),
    );
  }
}

getBackColorAuth(ButtonDecoration buttonStyle, SocialAuth authType) {
  bool isFacebook = authType == SocialAuth.facebook;
  bool isX = authType == SocialAuth.x;
  switch (buttonStyle) {
    case ButtonDecoration.defaultStyle:
      return isFacebook
          ? const Color(0xFF1877F2)
          : isX
              ? Colors.black
              : Colors.white;
    case ButtonDecoration.primaryStyle:
      return Colors.white;
    case ButtonDecoration.outlineStyle:
      return Colors.transparent;
  }
}
