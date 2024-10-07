import 'package:flutter/material.dart';
import 'package:main_auth/src/sign_up/widgets/bottom_sign_up_widget.dart';
import 'package:main_auth/src/sign_up/widgets/middle_sign_up_widget.dart';

import '../../main_auth.dart';
import 'widgets/top_sign_up_widget.dart';

/// A stateless widget that provides a customizable sign-up screen.
/// It includes various sections like top, middle, and bottom sign-up widgets,
/// along with customizable title, image, button styles, and social login actions.
///
/// The widget also allows for hiding the AppBar or individual sections,
/// and provides callbacks for handling sign-up actions and social login.
class SignUpScreen extends StatelessWidget {
  /// Controls whether the AppBar is hidden.
  /// If `true`, the AppBar will not be displayed.
  final bool hideAppBar;

  /// The title text displayed at the top of the sign-up screen.
  /// If `null`, a default localized title ("Sign up") will be shown.
  final String? title;

  /// An optional image widget that can be displayed at the top of the screen.
  /// Commonly used for branding or a logo.
  final Widget? image;

  /// Defines the type of social login buttons to be used in the bottom sign-up section.
  /// The default type is `ButtonSocialType.defaultType`.
  final ButtonSocialType buttonSocialType;

  /// Specifies the decoration style for social login buttons.
  /// The default style is `ButtonDecoration.defaultStyle`.
  final ButtonDecoration buttonStyle;

  /// The text style to be applied to the sign-up screen title.
  /// If `null`, a default text style is applied.
  final TextStyle? titleStyle;

  /// Controls whether the top sign-up section is hidden.
  /// If `true`, the top sign-up section will not be displayed.
  final bool hideTopSignUp;

  /// A custom widget to replace the default top sign-up section.
  /// If provided, this widget will be displayed in the top section.
  final Widget? topSignUpWidget;

  /// Controls whether the middle sign-up section is hidden.
  /// If `true`, the middle sign-up section will not be displayed.
  final bool hideMiddleSignUp;

  /// A custom widget to replace the default middle sign-up section.
  /// This can be used to include a custom sign-up form or other widgets.
  final Widget? middleSignUpWidget;

  /// Controls whether the bottom sign-up section is hidden.
  /// If `true`, the bottom sign-up section will not be displayed.
  final bool hideBottomSignUp;

  /// Controls whether the "Confirm Password" field is hidden.
  /// If `true`, the field for confirming the password will not be displayed.
  final bool hideConfirmPasswordField;

  /// Controls whether the phone number field is hidden.
  /// If `true`, the phone number field will not be displayed.
  final bool hidePhoneField;

  /// A custom widget to replace the default bottom sign-up section.
  /// This section usually contains social login buttons or additional options.
  final Widget? bottomSignUpWidget;

  /// Padding applied to the entire body of the sign-up screen.
  /// Defaults to `EdgeInsets.all(12)` if not provided.
  final EdgeInsets? padding;

  /// Callback function triggered when the user taps the "Sign up" button.
  /// Provides the entered email, password, and optionally phone and confirm password.
  final void Function(String email, String password,
      {String? phone, String? confirmPassword})? onSignUpPressed;

  /// Callback function triggered when the user taps on the Google login button.
  final VoidCallback? onTapGoogle;

  /// Callback function triggered when the user taps on the X (Twitter) login button.
  final VoidCallback? onTapX;

  /// Callback function triggered when the user taps on the Apple login button.
  final VoidCallback? onTapApple;

  /// Callback function triggered when the user taps on the Facebook login button.
  final VoidCallback? onTapFacebook;

  /// Callback function triggered when the user taps on the "Terms and Conditions" link.
  final VoidCallback? onTermsTap;

  final List<AuthType> authSocialTypesList;
  final String initialCountryCode;
  final List<String> favoriteCountryCode;

  /// Constructor for the [SignUpScreen] widget.
  ///
  /// The constructor allows for customization of various sign-up screen sections,
  /// such as the title, image, button styles, and callbacks for social login actions.
  /// You can also hide or display specific sections of the screen like the AppBar,
  /// top, middle, or bottom sections.
  const SignUpScreen({
    super.key,
    this.title,
    this.buttonSocialType = ButtonSocialType.defaultType,
    this.buttonStyle = ButtonDecoration.defaultStyle,
    this.image,
    this.titleStyle,
    this.hideAppBar = false,
    this.hideTopSignUp = false,
    this.hideMiddleSignUp = false,
    this.middleSignUpWidget,
    this.hideBottomSignUp = false,
    this.hideConfirmPasswordField = false,
    this.hidePhoneField = false,
    this.bottomSignUpWidget,
    this.topSignUpWidget,
    this.padding,
    this.onSignUpPressed,
    this.onTermsTap,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    this.initialCountryCode = '+20',
    this.favoriteCountryCode = const [
      '+20',
      '+966',
    ],
    this.authSocialTypesList = const [
      AuthType.google,
      AuthType.x,
      AuthType.apple,
      AuthType.facebook,
    ],
  });

  /// Builds the sign-up screen UI.
  ///
  /// The widget is composed of a [Scaffold] with an optional [AppBar]
  /// and a body that can contain three main sections:
  /// - Top sign-up section (optional, controlled by [hideTopSignUp])
  /// - Middle sign-up section (optional, controlled by [hideMiddleSignUp])
  /// - Bottom sign-up section (optional, controlled by [hideBottomSignUp])
  ///
  /// The body is wrapped in a `SingleChildScrollView` to ensure proper
  /// scrolling on smaller devices and a `SafeArea` to handle layouts on
  /// devices with notches.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
              title: Text(
                // Localization for the title; fallback to "Sign up" if not localized
                AuthMessage(key: 'sign_up').localize(context) ?? 'Sign up',
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding ??
              const EdgeInsets.all(12), // Default padding if not specified
          child: Column(
            children: [
              // Top sign-up section
              if (!hideTopSignUp)
                TopSignUpWidget(
                  title: title,
                  titleStyle: titleStyle,
                  image: image,
                  child: topSignUpWidget,
                ),

              // Middle sign-up section
              if (!hideMiddleSignUp)
                MiddleSignUpWidget(
                  initialCountryCode: initialCountryCode,
                  favoriteCountryCode: favoriteCountryCode,
                  hideConfirmPasswordField: hideConfirmPasswordField,
                  hidePhoneField: hidePhoneField,
                  onSignUpPressed: onSignUpPressed, // Sign-up callback
                  child: middleSignUpWidget,
                ),

              // Bottom sign-up section
              if (!hideBottomSignUp)
                BottomSignUpWidget(
                  onTapFacebook: onTapFacebook, // Facebook login callback
                  onTapApple: onTapApple, // Apple login callback
                  onTapGoogle: onTapGoogle, // Google login callback
                  onTapX: onTapX, // Twitter login callback
                  buttonStyle: buttonStyle, // Custom button styles
                  buttonSocialType: buttonSocialType, // Social button type
                  onTermsTap: onTermsTap, // Terms and Conditions callback
                  authTypesList: authSocialTypesList,
                  child: bottomSignUpWidget,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
