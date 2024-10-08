import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:main_auth/main_auth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: const Locale('ar'),
      localeResolutionCallback: (locale, supportedLocales) =>
          locale ?? const Locale('ar'),
      localizationsDelegates: const [
        ValidationLocalizations.delegate,
        AuthLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      buttonSocialType: ButtonSocialType.defaultType,
      loginType: LoginType.phone,
      authSocialTypesList: const [
        SocialAuth.apple,
        SocialAuth.google,
      ],
      onTapFacebook: () => log('facebook'),
      onTapGoogle: () => log('google'),
      onTapApple: () => log('apple'),
      onTapX: () => log('x'),
      onLoginPressed: (email, password) {
        log('$email, $password,');
      },
    );
    // return SignUpScreen(
    //   buttonSocialType: ButtonSocialType.defaultType,
    //   hideSocialAuth: true,
    //   authSocialTypesList: const [
    //     AuthType.apple,
    //     AuthType.google,
    //   ],
    //   onTapFacebook: () => log('facebook'),
    //   onTapGoogle: () => log('google'),
    //   onTapApple: () => log('apple'),
    //   onTapX: () => log('x'),
    //   onSignUpPressed: (email, password, {phone, confirmPassword}) =>
    //       log('$email, $password,$phone, $confirmPassword,'),
    // );
  }
}
