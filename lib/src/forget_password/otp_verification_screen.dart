// import 'dart:async';
// import 'dart:developer';
//
// import 'package:easy_localization/easy_localization.dart' hide TextDirection;
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:jawab/features/authentication_feature/presentation/providers/auth_provider.dart';
// import 'package:jawab/features/widgets/custom_back_button.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../core/extension/color_extension.dart';
// import '../../../../core/extension/context_extension.dart';
// import '../../../../core/request/auth_request.dart';
// import '../../../../core/routes/app_routes.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_images.dart';
// import '../../../../core/utils/app_styles.dart';
// import '../../../../core/widgets/custom_elevated_button.dart';
// import '../../../../core/widgets/show_custom_toast.dart';
// import '../../../../core/widgets/spacer_widget.dart';
// import '../../data/models/otp_request.dart';
// import '../widgets/header_auth_widget.dart';
//
// class OtpVerificationScreen extends StatefulWidget {
//   final OTPEnum type;
//   final String email;
//
//   const OtpVerificationScreen({
//     super.key,
//     required this.email,
//     required this.type,
//   });
//
//   @override
//   State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
// }
//
// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   bool isEmptyEmail = true;
//   bool isObscure = true;
//   // var onTapRecognizer;
//
//   TextEditingController textEditingController = TextEditingController();
//   late StreamController<ErrorAnimationType> errorController;
//   bool hasError = false;
//   String currentText = "";
//   final formKey = GlobalKey<FormState>();
//   Timer? timer;
//   int seconds = 59;
//   bool canResendCode = false;
//   int tries = 3;
//   void startTimer() {
//     timer?.cancel();
//     seconds = 59;
//     setState(() => canResendCode = false);
//     timer = Timer.periodic(
//       const Duration(seconds: 1),
//       (timer) {
//         if (seconds > 0) {
//           setState(() => seconds -= 1);
//         } else {
//           setState(() => canResendCode = true);
//         }
//       },
//     );
//   }
//
//   @override
//   void initState() {
//     // onTapRecognizer = TapGestureRecognizer()
//     //   ..onTap = () {
//     //     Navigator.pop(context);
//     //   };
//
//     // Future.delayed(
//     //   Duration.zero,
//     //   () => context.read<AuthProvider>().sendVerificationMail(
//     //         email: widget.verificationScreenModel.email!,
//     //       ),
//     // );
//     errorController = StreamController<ErrorAnimationType>();
//     startTimer();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     errorController.close();
//     timer?.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.bottomCenter,
//           children: [
//             Image.asset(AppImages.loginBackground),
//             Padding(
//               padding: AppPadding.page,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomBackButton(),
//                   const VerticalLargeSpacer(),
//                   const HeaderAuthWidget(title: 'verify_code'),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'code_sent_to_email'.tr(),
//                         style: context.labelMedium!
//                             .copyWith(color: const Color(0xff6C7075)),
//                       ),
//                       Text(
//                         widget.email,
//                         style: context.labelMedium!
//                             .copyWith(color: const Color(0xff6C7075)),
//                       ),
//                     ],
//                   ),
//                   const VerticalLargeSpacer(),
//                   Form(
//                     key: formKey,
//                     child: Directionality(
//                       textDirection: TextDirection.ltr,
//                       child: PinCodeTextField(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         appContext: context,
//                         pastedTextStyle: context.labelLarge,
//                         length: 4,
//                         obscureText: false,
//                         obscuringCharacter: '*',
//                         animationType: AnimationType.fade,
//                         validator: (v) {
//                           log('v=>  $v');
//                           return null;
//                           // if (v?.length < 3) {
//                           //   return "I'm from validator";
//                           // } else {
//                           //   return null;
//                           // }
//                         },
//                         pinTheme: PinTheme(
//                             activeColor: AppColors.primaryLight,
//                             disabledColor: AppColors.primaryLight,
//                             inactiveColor: AppColors.grey,
//                             inactiveFillColor: context.backgroundColor,
//                             selectedColor: AppColors.primaryLight,
//                             selectedFillColor: context.backgroundColor,
//                             shape: PinCodeFieldShape.box,
//                             borderRadius: BorderRadius.circular(16.r),
//                             fieldHeight: 56.h,
//                             fieldWidth: 58.w,
//                             activeFillColor: Colors.white,
//                             borderWidth: 0.8,
//                             activeBorderWidth: 0.8,
//                             selectedBorderWidth: 0.8,
//                             inactiveBorderWidth: 0.8,
//                             // hasError ? Colors.grey : Colors.white,
//                             fieldOuterPadding:
//                                 EdgeInsets.symmetric(horizontal: 4.w)),
//                         cursorColor: Colors.black,
//                         animationDuration: const Duration(milliseconds: 300),
//                         textStyle: context.labelLarge!.copyWith(height: 1),
//                         backgroundColor: context.backgroundColor,
//                         enableActiveFill: true,
//                         errorAnimationController: errorController,
//                         controller: textEditingController,
//                         keyboardType: TextInputType.number,
//                         boxShadows: const [
//                           BoxShadow(
//                             offset: Offset(0, 1),
//                             color: Colors.black38,
//                             blurRadius: 10,
//                           )
//                         ],
//                         onCompleted: (v) => log("Completed"),
//                         onChanged: (value) {
//                           log(value);
//                           setState(() {
//                             currentText = value;
//                           });
//                         },
//                         beforeTextPaste: (text) {
//                           log("Allowing to paste $text");
//
//                           return true;
//                         },
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                     child: Text(
//                       hasError ? "Please fill up all the cells properly" : "",
//                       style: context.bodyMedium?.copyWith(
//                         color: context.errorColor,
//                       ),
//                     ),
//                   ),
//                   Consumer<AuthProvider>(
//                     builder: (context, authProvider, child) =>
//                         CustomElevatedButton(
//                       isLoading: authProvider.isLoadingVerifiedOtp,
//                       label: 'confirm_',
//                       onPressed: () {
//                         if (formKey.currentState?.validate() ?? false) {
//                           if (currentText.length != 4) {
//                             errorController.add(ErrorAnimationType.shake);
//                             setState(() {
//                               hasError = true;
//                               showSuccessToast(msg: "length less than 4");
//                             });
//                           } else {
//                             setState(() => hasError = false);
//                             formKey.currentState?.save();
//                             context.read<AuthProvider>().verifiedOtp(
//                                   verifiedOtpRequest: VerifiedOtpRequest(
//                                     email: widget.email,
//                                     otp: currentText,
//                                   ),
//                                   onSuccess: () {
//                                     if (widget.type == OTPEnum.forget) {
//                                       context.pushReplacementNamed(
//                                         routeName: Routes.newPasswordScreen,
//                                       );
//                                     } else {
//                                       Navigator.of(context)
//                                           .pushNamedAndRemoveUntil(
//                                         Routes.navigationBarScreen,
//                                         (route) => false,
//                                       );
//                                     }
//                                   },
//                                 );
//                           }
//                         }
//                       },
//                     ),
//                   ),
//                   const VerticalLargeSpacer(),
//                   if (tries != 0)
//                     Row(
//                       children: [
//                         InkWell(
//                           onTap: canResendCode
//                               ? () {
//                                   startTimer();
//                                   context.read<AuthProvider>().sendOtp(
//                                         otpRequest: OTPRequest(
//                                             email: widget.email,
//                                             type: widget.type),
//                                       );
//                                   setState(() => tries--);
//                                 }
//                               : null,
//                           child: Text(
//                             canResendCode
//                                 ? "resend_code".tr()
//                                 : "resend_code_after".tr(),
//                             style: canResendCode
//                                 ? context.labelLarge!
//                                     .copyWith(color: context.primaryColor)
//                                 : context.bodyMedium,
//                           ),
//                         ),
//                         const HorizontalSmallSpacer(),
//                         if (!canResendCode)
//                           Text(
//                               ('00:${seconds.toString().padLeft(2, '0')} ${'second_time'.tr()}')),
//                         const Spacer(),
//                         Text(
//                             '${'remain_for_you'.tr()} $tries ${'tries_'.tr()}'),
//                       ],
//                     ),
//                   const VerticalLargeSpacer(),
//                   InkWell(
//                     onTap: () => Navigator.of(context).pop(),
//                     child: Text(
//                       "enter_another_email".tr(),
//                       style: context.labelLarge!
//                           .copyWith(color: context.primaryColor),
//                     ),
//                   ),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
