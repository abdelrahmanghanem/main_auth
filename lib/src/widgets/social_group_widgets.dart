import 'dart:io';

import 'package:flutter/material.dart';

import '../../main_auth.dart';

class SocialGroupWidgets extends StatelessWidget {
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapX;
  final VoidCallback? onTapApple;
  final VoidCallback? onTapFacebook;
  final double borderRadius;
  final double spacing;
  final Widget? icon;
  final ButtonSocialType? buttonType;
  final ButtonDecoration? buttonStyle;
  final List<AuthType> listAuthType;

  const SocialGroupWidgets({
    super.key,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    this.borderRadius = 8.0,
    this.icon,
    this.spacing = 8.0,
    this.buttonType,
    this.buttonStyle,
    required this.listAuthType,
  });

  @override
  Widget build(BuildContext context) {
    return buttonType == ButtonSocialType.icon
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Platform.isIOS && listAuthType.contains(AuthType.apple)) ...[
                SocialButtonWidget(
                  onTap: onTapApple,
                  buttonStyle: buttonStyle,
                  authType: AuthType.apple,
                  icon: icon,
                  buttonType: buttonType,
                  borderRadius: borderRadius,
                ),
                SizedBox(width: spacing),
              ],
              if (listAuthType.contains(AuthType.google)) ...[
                SocialButtonWidget(
                  onTap: onTapGoogle,
                  icon: icon,
                  buttonType: buttonType,
                  buttonStyle: buttonStyle,
                  authType: AuthType.google,
                  borderRadius: borderRadius,
                ),
                SizedBox(width: spacing),
              ],
              if (listAuthType.contains(AuthType.x)) ...[
                SocialButtonWidget(
                  onTap: onTapX,
                  icon: icon,
                  buttonType: buttonType,
                  buttonStyle: buttonStyle,
                  authType: AuthType.x,
                  borderRadius: borderRadius,
                ),
                SizedBox(width: spacing),
              ],
              if (listAuthType.contains(AuthType.facebook)) ...[
                SocialButtonWidget(
                  onTap: onTapFacebook,
                  buttonType: buttonType,
                  buttonStyle: buttonStyle,
                  authType: AuthType.facebook,
                  icon: icon,
                  borderRadius: borderRadius,
                ),
              ],
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Platform.isIOS && listAuthType.contains(AuthType.apple)) ...[
                SocialButtonWidget(
                  onTap: onTapApple,
                  buttonStyle: buttonStyle,
                  buttonType: buttonType,
                  authType: AuthType.apple,
                  icon: icon,
                  borderRadius: borderRadius,
                ),
                SizedBox(height: spacing),
              ],
              if (listAuthType.contains(AuthType.google)) ...[
                SocialButtonWidget(
                  onTap: onTapGoogle,
                  icon: icon,
                  buttonStyle: buttonStyle,
                  buttonType: buttonType,
                  authType: AuthType.google,
                  borderRadius: borderRadius,
                ),
                SizedBox(height: spacing),
              ],
              if (listAuthType.contains(AuthType.x)) ...[
                SocialButtonWidget(
                  onTap: onTapX,
                  icon: icon,
                  buttonStyle: buttonStyle,
                  buttonType: buttonType,
                  authType: AuthType.x,
                  borderRadius: borderRadius,
                ),
                SizedBox(height: spacing),
              ],
              if (listAuthType.contains(AuthType.facebook)) ...[
                SocialButtonWidget(
                  onTap: onTapFacebook,
                  buttonStyle: buttonStyle,
                  buttonType: buttonType,
                  authType: AuthType.facebook,
                  icon: icon,
                  borderRadius: borderRadius,
                ),
              ],
            ],
          );
  }
}
