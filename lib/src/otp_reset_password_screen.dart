// import 'package:easy_localization/easy_localization.dart' hide TextDirection;
// import 'package:flutter/material.dart';
// import 'package:jawab/core/extension/context_extension.dart';
//
// import '../../../../core/functions/validation_functions.dart';
// import '../../../../core/widgets/custom_elevated_button.dart';
// import '../../../../core/widgets/custom_text_field.dart';
// import '../../../../core/widgets/spacer_widget.dart';
//
// class OtpResetPasswordScreen extends StatefulWidget {
//   const OtpResetPasswordScreen({super.key});
//
//   @override
//   State<OtpResetPasswordScreen> createState() => _OtpResetPasswordScreenState();
// }
//
// class _OtpResetPasswordScreenState extends State<OtpResetPasswordScreen> {
//   bool isObscure2 = true;
//   bool isObscure3 = true;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? newPassword;
//   String? confirmPassword;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("update_password").tr(),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const VerticalExtraLargeSpacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   "new_password",
//                   style: context.bodyMedium,
//                 ).tr(),
//               ),
//               const VerticalMediumSpacer(),
//               Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: CustomTextFormField(
//                   suffixIcon: IconButton(
//                     splashColor: Colors.transparent,
//                     onPressed: () => setState(
//                       () => isObscure2 = !isObscure2,
//                     ),
//                     icon: isObscure2
//                         ? Icon(
//                             Icons.visibility_outlined,
//                             color: Colors.grey[300],
//                           )
//                         : Icon(Icons.visibility_off_outlined,
//                             color: Colors.grey[300]),
//                   ),
//                   obscureText: isObscure2,
//                   keyboardType: TextInputType.visiblePassword,
//                   validator: passwordValidation,
//                   onChanged: (String? value) => newPassword = value,
//                   onSave: (String? value) => newPassword = value,
//                 ),
//               ),
//               const VerticalExtraLargeSpacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   "new_password_confirmation",
//                   style: context.bodyMedium,
//                 ).tr(),
//               ),
//               const VerticalMediumSpacer(),
//               Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: CustomTextFormField(
//                   suffixIcon: IconButton(
//                     splashColor: Colors.transparent,
//                     onPressed: () => setState(
//                       () => isObscure3 = !isObscure3,
//                     ),
//                     icon: isObscure3
//                         ? Icon(
//                             Icons.visibility_outlined,
//                             color: Colors.grey[300],
//                           )
//                         : Icon(Icons.visibility_off_outlined,
//                             color: Colors.grey[300]),
//                   ),
//                   obscureText: isObscure3,
//                   keyboardType: TextInputType.visiblePassword,
//                   validator: (String? value) {
//                     if (value!.isEmpty) {
//                       return 'please_enter_your_confirm_password'.tr();
//                     }
//                     if (value != newPassword) {
//                       return 'password_does_not_match'.tr();
//                     }
//                     confirmPassword = value;
//                     return null;
//                   },
//                   onSave: (String? value) => confirmPassword = value,
//                 ),
//               ),
//               const VerticalExtraLargeSpacer(),
//               SizedBox(
//                 width: 350,
//                 child: CustomElevatedButton(
//                   label: "save_",
//                   onPressed: () async {
//                     if (_formKey.currentState?.validate() ?? false) {
//                       _formKey.currentState?.save();
//
//                       // await context.read<AuthProvider>().updatePassword(
//                       //       password: newPassword!,
//                       //     );
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
