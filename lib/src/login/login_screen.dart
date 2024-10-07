import 'package:flutter/material.dart';

import '../../main_auth.dart';
import 'widgets/bottom_login_widget.dart';
import 'widgets/top_login_widget.dart';

/// A stateless widget that provides a customizable login screen.
/// It allows the integration of various sections such as top, middle,
/// and bottom login widgets, along with customizable title, image,
/// button styles, and login actions.
///
/// The widget also provides toggles for hiding the AppBar or individual
/// sections, and a callback for handling the login action.
class LoginScreen extends StatelessWidget {
  /// Controls whether the AppBar is visible or hidden.
  /// If true, the AppBar will not be displayed.
  final bool hideAppBar;

  /// The title to be displayed at the top of the screen, if provided.
  /// This can be `null`, in which case a default title will be used.
  final String? title;

  /// An optional image widget that can be displayed along with the title.
  /// Commonly used for displaying a logo or other branding.
  final Widget? image;

  /// Defines the type of social login buttons to be used in the bottom login section.
  /// The default type is `ButtonSocialType.defaultType`.
  final ButtonSocialType buttonSocialType;

  /// Customizes the decoration and style of the social login buttons.
  /// The default style is `ButtonDecoration.defaultStyle`.
  final ButtonDecoration buttonStyle;

  /// The text style applied to the title, if one is provided.
  /// If null, the default style is used.
  final TextStyle? titleStyle;

  /// Controls whether the top login section is hidden.
  /// If true, the top login section will not be displayed.
  final bool hideTopLogin;

  /// An optional widget to replace the default top login section.
  /// You can provide custom content here.
  final Widget? topLoginWidget;

  /// Controls whether the middle login section is hidden.
  /// If true, the middle login section will not be displayed.
  final bool hideMiddleLogin;

  /// An optional widget to replace the default middle login section.
  /// This can be a custom form or other widgets to handle login inputs.
  final Widget? middleLoginWidget;

  /// Controls whether the bottom login section is hidden.
  /// If true, the bottom login section will not be displayed.
  final bool hideBottomLogin;

  /// An optional widget to replace the default bottom login section.
  /// Typically, this is where social login buttons or additional options are placed.
  final Widget? bottomLoginWidget;

  /// Padding around the body content of the login screen.
  /// Defaults to `EdgeInsets.all(12)` if not provided.
  final EdgeInsets? padding;

  /// Callback function triggered when the user taps on the Google login button.
  final VoidCallback? onTapGoogle;

  /// Callback function triggered when the user taps on the X (Twitter) login button.
  final VoidCallback? onTapX;

  /// Callback function triggered when the user taps on the Apple login button.
  final VoidCallback? onTapApple;

  /// Callback function triggered when the user taps on the Facebook login button.
  final VoidCallback? onTapFacebook;

  /// A callback function that is triggered when the login button is pressed.
  /// It provides the entered email and password as arguments.
  final void Function(String email, String password)? onLoginPressed;
  final List<AuthType> authTypesList;
  final LoginType loginType;
  final String initialCountryCode;
  final List<String> favoriteCountryCode;
  final String? Function(String?)? emailValidator;
  final String? Function(String?)? passwordValidator;
  final String? Function(String?)? phoneValidator;

  /// Constructor for the [LoginScreen] widget.
  ///
  /// The constructor allows for customization of various login screen sections
  /// such as the title, image, button styles, and callback for login action.
  /// You can also hide or display specific sections of the screen.
  const LoginScreen({
    super.key,
    this.title,
    this.image,
    this.titleStyle,
    this.hideAppBar = false,
    this.hideTopLogin = false,
    this.topLoginWidget,
    this.hideMiddleLogin = false,
    this.middleLoginWidget,
    this.hideBottomLogin = false,
    this.bottomLoginWidget,
    this.padding,
    this.onLoginPressed,
    this.buttonSocialType = ButtonSocialType.defaultType,
    this.buttonStyle = ButtonDecoration.defaultStyle,
    this.onTapGoogle,
    this.onTapX,
    this.onTapApple,
    this.onTapFacebook,
    this.loginType = LoginType.email,
    this.initialCountryCode = '+20',
    this.favoriteCountryCode = const [
      '+20',
      '+966',
    ],
    this.authTypesList = const [
      AuthType.apple,
      AuthType.google,
      AuthType.x,
      AuthType.facebook,
    ],
    this.emailValidator,
    this.passwordValidator,
    this.phoneValidator,
  });

  /// Builds the login screen UI.
  ///
  /// The widget is composed of a Scaffold with an optional AppBar and
  /// a body that can contain three main sections:
  /// - Top login section (optional, controlled by [hideTopLogin])
  /// - Middle login section (optional, controlled by [hideMiddleLogin])
  /// - Bottom login section (optional, controlled by [hideBottomLogin])
  ///
  /// The body is wrapped in a `SingleChildScrollView` to ensure proper
  /// scrolling on smaller devices, and a `SafeArea` for proper layout
  /// on devices with notches.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hideAppBar
          ? null
          : AppBar(
              title: Text(
                // Localization for the title; fallback to "Login" if not localized
                AuthMessage(key: 'login_').localize(context) ?? 'Login',
              ),
            ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: padding ??
              const EdgeInsets.all(
                  12), // Default padding of 12 if not specified
          child: Column(
            children: [
              // Top login section
              if (!hideTopLogin)
                TopLoginWidget(
                  title: title,
                  titleStyle: titleStyle,
                  image: image,
                  child: topLoginWidget,
                ),

              // Middle login section
              if (!hideMiddleLogin)
                MiddleLoginWidget(
                  favoriteCountryCode: favoriteCountryCode,
                  initialCountryCode: initialCountryCode,
                  loginType: loginType,
                  onLoginPressed: onLoginPressed,
                  emailValidator: emailValidator,
                  passwordValidator: passwordValidator,
                  phoneValidator: phoneValidator, // Login callback
                  child: middleLoginWidget,
                ),

              // Bottom login section
              if (!hideBottomLogin)
                BottomLoginWidget(
                  onTapFacebook: onTapFacebook, // Facebook login callback
                  onTapApple: onTapApple, // Apple login callback
                  onTapGoogle: onTapGoogle, // Google login callback
                  onTapX: onTapX, // Twitter login callback
                  authTypesList: authTypesList,
                  buttonType: buttonSocialType,
                  buttonStyle: buttonStyle,
                  child: bottomLoginWidget,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
