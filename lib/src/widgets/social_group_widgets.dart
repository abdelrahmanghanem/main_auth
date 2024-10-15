import 'dart:io';

import 'package:flutter/material.dart';

import '../../main_auth.dart';

class SocialGroupWidgets extends StatelessWidget {
  final SocialModel socialModel;

  const SocialGroupWidgets({super.key, required this.socialModel});

  @override
  Widget build(BuildContext context) {
    getSpacing() {
      return socialModel.socialButtonType == SocialButtonType.icon
          ? SizedBox(width: socialModel.socialSpacing)
          : SizedBox(height: socialModel.socialSpacing);
    }

    return SizedBox(
      height: socialModel.socialButtonType == SocialButtonType.icon ? 44 : null,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: socialModel.socialButtonType == SocialButtonType.icon
            ? Axis.horizontal
            : Axis.vertical,
        children: [
          if (Platform.isIOS &&
              socialModel.socialAuthList.contains(SocialAuth.apple)) ...[
            SocialButtonWidget(
              onTap: socialModel.onTapApple,
              buttonStyle: socialModel.socialButtonDecoration,
              authType: SocialAuth.apple,
              socialButtonType: socialModel.socialButtonType,
              borderRadius: socialModel.socialBorderRadius,
            ),
            getSpacing(),
          ],
          if (socialModel.socialAuthList.contains(SocialAuth.google)) ...[
            SocialButtonWidget(
              onTap: socialModel.onTapGoogle,
              socialButtonType: socialModel.socialButtonType,
              buttonStyle: socialModel.socialButtonDecoration,
              authType: SocialAuth.google,
              borderRadius: socialModel.socialBorderRadius,
            ),
            getSpacing(),
          ],
          if (socialModel.socialAuthList.contains(SocialAuth.x)) ...[
            SocialButtonWidget(
              onTap: socialModel.onTapX,
              socialButtonType: socialModel.socialButtonType,
              buttonStyle: socialModel.socialButtonDecoration,
              authType: SocialAuth.x,
              borderRadius: socialModel.socialBorderRadius,
            ),
            getSpacing(),
          ],
          if (socialModel.socialAuthList.contains(SocialAuth.facebook)) ...[
            SocialButtonWidget(
              onTap: socialModel.onTapFacebook,
              socialButtonType: socialModel.socialButtonType,
              buttonStyle: socialModel.socialButtonDecoration,
              authType: SocialAuth.facebook,
              borderRadius: socialModel.socialBorderRadius,
            ),
          ],
        ],
      ),
    );
  }
}
