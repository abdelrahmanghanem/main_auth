import 'package:flutter/material.dart';

import '../../main_auth.dart';

class SocialModel {
  final SocialButtonType socialButtonType;
  final SocialButtonDecoration socialButtonDecoration;
  final List<SocialAuth> socialAuthList;
  final double socialBorderRadius;
  final double socialSpacing;
  final bool hideSocialAuth;
  final VoidCallback? onTapGoogle;
  final VoidCallback? onTapX;
  final VoidCallback? onTapApple;
  final VoidCallback? onTapFacebook;

  /// Constructor for AuthModel.
  const SocialModel({
    this.hideSocialAuth = false,
    this.socialBorderRadius = 8.0,
    this.socialSpacing = 8.0,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    this.socialButtonType = SocialButtonType.defaultType,
    this.socialButtonDecoration = SocialButtonDecoration.defaultStyle,
    this.socialAuthList = const [
      SocialAuth.apple,
      SocialAuth.google,
      SocialAuth.x,
      SocialAuth.facebook,
    ],
  });
}
