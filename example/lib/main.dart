import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:main_auth/main_auth.dart';
import 'package:smart_localize/smart_localize.dart';

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
          locale ?? const Locale('en'),
      localizationsDelegates: context.smartLocalizeDelegates,
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ForgotPasswordWidget(
                forgetPasswordModel: ForgetPasswordModel.empty(
                  screenAlignment: MediaQuery.of(context).size.width < 400
                      ? AlignmentDirectional.topStart
                      : AlignmentDirectional.center,
                  maxWidth: 370,
                  otpType: OTPType.email,
                  onSend: (email, type, onSuccess) async {
                    log('onSend: $email, type: $type');
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () => onSuccess?.call('21sdf65sf231asdf5'),
                    );
                  },
                  onResendOTP: (email, type, token, onSuccess) async {
                    log('onResendOTP: $email, type: $type');
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () => onSuccess?.call(),
                    );
                  },
                  onVerify: (email, otp, token, onSuccess) async {
                    log('onVerify: $email, OTP: $otp');
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () => onSuccess?.call(),
                    );
                  },
                  onResetPassword: (email, password, token, onSuccess) async {
                    log('onResetPassword: $password');
                    await Future.delayed(
                      const Duration(seconds: 2),
                      () => onSuccess?.call(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return MainAuth(
    //   loginModel: AuthModel(
    //     hideAppBar: true,
    //     isLoading: true,
    //     onPressed: (email, password, phone, name) =>
    //         log('$email, $password,$phone'),
    //     socialModel: SocialModel(
    //       onTapFacebook: () => log('facebook'),
    //       onTapGoogle: () => log('google'),
    //       onTapApple: () => log('apple'),
    //       onTapX: () => log('x'),
    //       // hideSocialAuth: true,
    //       socialButtonType: SocialButtonType.defaultType,
    //       // hideSocialAuth: true,
    //       socialAuthList: const [
    //         SocialAuth.apple,
    //         SocialAuth.google,
    //         SocialAuth.facebook,
    //         SocialAuth.x,
    //       ],
    //     ),
    //   ),
    //   signUpModel: AuthModel(
    //     hideAppBar: true,
    //     isLoading: true,
    //     onPressed: (email, password, phone, name) =>
    //         log('$email, $password,$phone '),
    //     socialModel: SocialModel(
    //       onTapFacebook: () => log('facebook'),
    //       onTapGoogle: () => log('google'),
    //       onTapApple: () => log('apple'),
    //       onTapX: () => log('x'),
    //
    //       socialButtonType: SocialButtonType.icon,
    //       // hideSocialAuth: true,
    //       // hideSocialAuth: true,
    //       socialAuthList: const [
    //         SocialAuth.apple,
    //         SocialAuth.google,
    //         SocialAuth.facebook,
    //         SocialAuth.x,
    //       ],
    //     ),
    //   ),
    // );
  }
}
