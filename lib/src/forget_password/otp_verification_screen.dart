import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main_auth/src/models/forget_password_model.dart';
import 'package:main_button/main_button.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_localize/smart_localize.dart';

import 'new_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  final ForgetPasswordModel forgetPasswordModel;

  const OtpVerificationScreen({
    super.key,
    required this.forgetPasswordModel,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  bool isEmptyCode = true;
  String code = "";
  final formKey = GlobalKey<FormState>();
  Timer? timer;
  int seconds = 59;
  bool canResendCode = false;
  late int tries = widget.forgetPasswordModel.maxTries;
  bool isLoading = false;

  void startTimer() {
    timer?.cancel();
    seconds = 59;
    setState(() => canResendCode = false);
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (seconds > 0) {
          setState(() => seconds -= 1);
        } else {
          setState(() => canResendCode = true);
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    log('Token: ${widget.forgetPasswordModel.token}');
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SmartLocalize.changePassword),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Align(
            alignment: widget.forgetPasswordModel.screenAlignment,
            child: SizedBox(
              width: widget.forgetPasswordModel.maxWidth ?? 370,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.forgetPasswordModel.otpLength == 4
                              ? SmartLocalize.enter4DigitsCode
                              : SmartLocalize.enter6DigitsCode,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        Text(
                          widget.forgetPasswordModel.emailOrPhone!,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 16),
                        Form(
                          key: formKey,
                          child: Pinput(
                            mainAxisAlignment: MainAxisAlignment.start,
                            length: widget.forgetPasswordModel.otpLength,
                            obscureText: false,
                            validator: (v) {
                              if (v!.trim().length !=
                                  widget.forgetPasswordModel.otpLength) {
                                log(v.length.toString());
                                return SmartLocalizeValidation.invalidValue;
                              } else {
                                return null;
                              }
                            },
                            onChanged: (value) => setState(() {
                              isEmptyCode = value.isEmpty;
                              code = value;
                            }),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            defaultPinTheme: PinTheme(
                              width: 58,
                              height: 56,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            focusedPinTheme: PinTheme(
                              width: 58,
                              height: 56,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            errorTextStyle:
                                Theme.of(context).textTheme.bodySmall,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onCompleted: (value) => onVerify(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        if (widget.forgetPasswordModel.showTries) ...[
                          if (tries != 0)
                            Row(
                              children: [
                                InkWell(
                                  onTap: canResendCode
                                      ? () {
                                          startTimer();
                                          widget.forgetPasswordModel.onResendOTP
                                              ?.call(
                                            widget.forgetPasswordModel
                                                .emailOrPhone!,
                                            widget.forgetPasswordModel.otpType,
                                            widget.forgetPasswordModel.token!,
                                            () => setState(() => tries--),
                                          );
                                        }
                                      : null,
                                  child: Text(
                                    canResendCode
                                        ? SmartLocalize.resendOtp
                                        : SmartLocalize.resendCodeAfter,
                                    style: canResendCode
                                        ? Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            )
                                        : Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                if (!canResendCode)
                                  Text(
                                      ('00:${seconds.toString().padLeft(2, '0')} ${SmartLocalize.secondTime}')),
                                const Spacer(),
                                Text(
                                  '${SmartLocalize.remainForYou} $tries ${SmartLocalize.tries}',
                                ),
                              ],
                            ),
                        ] else
                          Row(
                            children: [
                              InkWell(
                                onTap: canResendCode
                                    ? () {
                                        startTimer();
                                        widget.forgetPasswordModel.onResendOTP
                                            ?.call(
                                          widget.forgetPasswordModel
                                              .emailOrPhone!,
                                          widget.forgetPasswordModel.otpType,
                                          widget.forgetPasswordModel.token!,
                                          null,
                                        );
                                      }
                                    : null,
                                child: Text(
                                  canResendCode
                                      ? SmartLocalize.resendOtp
                                      : SmartLocalize.resendCodeAfter,
                                  style: canResendCode
                                      ? Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          )
                                      : Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                              const SizedBox(width: 8),
                              if (!canResendCode)
                                Text(
                                    ('00:${seconds.toString().padLeft(2, '0')} ${SmartLocalize.secondTime}')),
                              const Spacer(),
                            ],
                          ),
                        if (widget
                            .forgetPasswordModel.showEnterAnotherEmail) ...[
                          const SizedBox(height: 16),
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Text(
                              SmartLocalize.enterAnotherEmail,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: MainButton(
              isLoading: isLoading,
              isDisable: isEmptyCode,
              showShadow: false,
              disableColor: const Color(0xffE7E7E7),
              label: SmartLocalize.verify,
              onPressed: onVerify,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Future<void> onVerify() async {
    if (formKey.currentState?.validate() ?? false) {
      setState(() => isLoading = true);
      await widget.forgetPasswordModel.onVerify?.call(
        widget.forgetPasswordModel.emailOrPhone!,
        code,
        widget.forgetPasswordModel.token!,
        () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => NewPasswordScreen(
              forgetPasswordModel: widget.forgetPasswordModel,
            ),
          ),
        ),
      );
      // if (mounted) setState(() => isLoading = false);
    }
  }
}
