// import 'package:flutter/material.dart';
// import 'package:smart_localize/smart_localize.dart';

// class OtpResetPasswordScreen extends StatefulWidget {
//   const OtpResetPasswordScreen({super.key});

//   @override
//   State<OtpResetPasswordScreen> createState() => _OtpResetPasswordScreenState();
// }

// class _OtpResetPasswordScreenState extends State<OtpResetPasswordScreen> {
//   bool isObscure2 = true;
//   bool isObscure3 = true;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String? newPassword;
//   String? confirmPassword;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(SmartLocalize.changePassword)),
//       body: Form(
//         key: _formKey,
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Text(
//                   'enter_4_digit_code',
//                   style: Theme.of(context).textTheme.bodyMedium,
//                 ),
//               ),
//               const SizedBox(height: 16),
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
