# Main Auth

This package provides a customizable **Login** and **Sign-Up** screen for Flutter applications. It allows easy integration of login forms, social login buttons, and customization of titles, styles, and layouts.
## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Localization](#localization)
- [Constructor Parameters For Login](#constructor-parameters-for-login)
    - [Example Usage Login](#example-usage-login)
- [Constructor Parameters For SignUp](#constructor-parameters-for-signup)
    - [Example Usage SignUp](#example-usage-signup)
- [Contributions](#contributions)


## Features

- **LoginScreen**: A customizable login screen with configurable top, middle, and bottom sections.
- **SignUpScreen**: A customizable sign-up screen with support for additional fields such as phone number and confirm password.
- **Social Login Integration**: Provides easy-to-use social login buttons for Google, Apple, Facebook, and Twitter (X).
- **Customizable Styles**: You can apply custom button styles, titles, and layout configurations.
- **Callback Support**: Handle actions such as login, sign-up, and social login button presses via callbacks.

## Installation

1. Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  main_auth: <latest_version>
```
## Localization

To enable validation message localization in the Factory Constructors, add `ValidationLocalizations.delegate` to your app's list of delegates:

```dart
  MaterialApp(
    localizationsDelegates: [
      ValidationLocalizations.delegate,
      AuthLocalizations.delegate,
   
      // other delegates...
    ],
    // other app configurations...
  )
```
## Constructor Parameters For Login

| Parameter          | Type                                                    | Default                          | Description                                                                                                                                                        |
|--------------------|---------------------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `hideAppBar`        | `bool`                                                  | `false`                          | Controls whether the AppBar is visible or hidden.                                                                                                                   |
| `title`             | `String?`                                               | `null`                           | The title to be displayed at the top of the screen. If `null`, a default "Login" title is used.                                                                     |
| `image`             | `Widget?`                                               | `null`                           | An optional image widget, typically used for displaying a logo.                                                                                                     |
| `buttonSocialType`  | `ButtonSocialType`                                      | `ButtonSocialType.defaultType`    | Defines the type of social login buttons in the bottom section.                                                                                                     |
| `buttonStyle`       | `ButtonDecoration`                                      | `ButtonDecoration.defaultStyle`   | Defines the decoration and style for social login buttons.                                                                                                          |
| `titleStyle`        | `TextStyle?`                                            | `null`                           | Optional style for the title. If `null`, the default text style is used.                                                                                            |
| `hideTopLogin`      | `bool`                                                  | `false`                          | Controls whether the top login section is hidden.                                                                                                                   |
| `topLoginWidget`    | `Widget?`                                               | `null`                           | Optional widget to replace the default top login section.                                                                                                           |
| `hideMiddleLogin`   | `bool`                                                  | `false`                          | Controls whether the middle login section is hidden.                                                                                                                |
| `middleLoginWidget` | `Widget?`                                               | `null`                           | Optional widget to replace the default middle login section.                                                                                                        |
| `hideBottomLogin`   | `bool`                                                  | `false`                          | Controls whether the bottom login section is hidden.                                                                                                                |
| `bottomLoginWidget` | `Widget?`                                               | `null`                           | Optional widget to replace the default bottom login section.                                                                                                        |
| `padding`           | `EdgeInsets?`                                           | `EdgeInsets.all(12)`              | Padding around the body content.                                                                                                                                   |
| `onLoginPressed`    | `void Function(String email, String password)?`         | `null`                           | Callback function triggered when the login button is pressed, passing the entered email and password.                                                               |

# Example Usage Login
```dart
    LoginScreen(
      title: 'Welcome Back',
      image: Image.asset('assets/logo.png'),
      hideAppBar: true,
      onLoginPressed: (email, password) {
        // Handle login action
      },
      hideTopLogin: false,
      hideMiddleLogin: false,
      hideBottomLogin: false,
      buttonSocialType: ButtonSocialType.google,
      buttonStyle: ButtonDecoration.rounded,
    )
```
## Constructor Parameters For SignUp

| Parameter                | Type                                                    | Default                           | Description                                                                                                                                                            |
|--------------------------|---------------------------------------------------------|-----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `hideAppBar`              | `bool`                                                  | `false`                           | Controls whether the AppBar is visible or hidden.                                                                                                                       |
| `title`                   | `String?`                                               | `null`                            | Optional title displayed at the top of the screen. If `null`, a default localized title ("Sign up") is shown.                                                           |
| `image`                   | `Widget?`                                               | `null`                            | An optional image widget, commonly used for displaying a logo or branding.                                                                                              |
| `buttonSocialType`        | `ButtonSocialType`                                      | `ButtonSocialType.defaultType`     | Defines the type of social login buttons in the bottom section.                                                                                                         |
| `buttonStyle`             | `ButtonDecoration`                                      | `ButtonDecoration.defaultStyle`    | Defines the decoration and style of social login buttons.                                                                                                               |
| `titleStyle`              | `TextStyle?`                                            | `null`                            | Optional style applied to the title. If not provided, the default text style is used.                                                                                   |
| `hideTopSignUp`           | `bool`                                                  | `false`                           | Controls whether the top sign-up section is hidden.                                                                                                                     |
| `topSignUpWidget`         | `Widget?`                                               | `null`                            | An optional widget to replace the default top sign-up section.                                                                                                          |
| `hideMiddleSignUp`        | `bool`                                                  | `false`                           | Controls whether the middle sign-up section is hidden.                                                                                                                  |
| `middleSignUpWidget`      | `Widget?`                                               | `null`                            | An optional widget to replace the default middle sign-up section.                                                                                                       |
| `hideBottomSignUp`        | `bool`                                                  | `false`                           | Controls whether the bottom sign-up section is hidden.                                                                                                                  |
| `hideConfirmPasswordField`| `bool`                                                  | `false`                           | Controls whether the "Confirm Password" field is hidden.                                                                                                                |
| `hidePhoneField`          | `bool`                                                  | `false`                           | Controls whether the phone number field is hidden.                                                                                                                      |
| `bottomSignUpWidget`      | `Widget?`                                               | `null`                            | An optional widget to replace the default bottom sign-up section, typically for social login buttons or additional options.                                              |
| `padding`                 | `EdgeInsets?`                                           | `EdgeInsets.all(12)`               | Padding applied around the body content.                                                                                                                                 |
| `onSignUpPressed`         | `void Function(String email, String password, {String? phone, String? confirmPassword})?` | `null`  | Callback function triggered when the "Sign up" button is pressed, providing the entered email, password, and optionally phone number and confirm password.               |
| `onTapGoogle`             | `VoidCallback?`                                         | `null`                            | Callback function triggered when the Google login button is pressed.                                                                                                    |
| `onTapX`                  | `VoidCallback?`                                         | `null`                            | Callback function triggered when the X (Twitter) login button is pressed.                                                                                               |
| `onTapApple`              | `VoidCallback?`                                         | `null`                            | Callback function triggered when the Apple login button is pressed.                                                                                                     |
| `onTapFacebook`           | `VoidCallback?`                                         | `null`                            | Callback function triggered when the Facebook login button is pressed.                                                                                                  |
| `onTermsTap`              | `VoidCallback?`                                         | `null`                            | Callback function triggered when the "Terms and Conditions" link is pressed.                                                                                            |

## Example Usage SignUp

```dart
    SignUpScreen(
      title: 'Create Your Account',
      image: Image.asset('assets/logo.png'),
      hideAppBar: true,
      onSignUpPressed: (email, password, {phone, confirmPassword}) {
        // Handle sign-up logic here
      },
      onTapGoogle: () {
        // Handle Google sign-up
      },
      onTapFacebook: () {
        // Handle Facebook sign-up
      },
      hideConfirmPasswordField: false,
      hidePhoneField: true, // Hide phone number field
      buttonSocialType: ButtonSocialType.google,
      buttonStyle: ButtonDecoration.rounded,
    )
```

## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/abdelrahmanghanem/main_auth/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/abdelrahmanghanem/main_auth/pulls).

<a href="https://github.com/abdelrahmanghanem/main_auth/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=abdelrahmanghanem/main_auth"  alt=""/>
</a>

Made with [contrib.rocks](https://contrib.rocks).
