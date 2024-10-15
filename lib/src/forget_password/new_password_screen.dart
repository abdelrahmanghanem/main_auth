// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:jawab/features/authentication_feature/presentation/pages/reset_password_success_screen.dart';
// import 'package:jawab/features/widgets/custom_back_button.dart';
// import 'package:provider/provider.dart';
//
// import '../../../../core/app/app.dart';
// import '../../../../core/extension/context_extension.dart';
// import '../../../../core/functions/validation_functions.dart';
// import '../../../../core/icons_path/iconsax/iconsax_icons.dart';
// import '../../../../core/routes/app_routes.dart';
// import '../../../../core/utils/app_colors.dart';
// import '../../../../core/utils/app_images.dart';
// import '../../../../core/utils/app_styles.dart';
// import '../../../../core/widgets/custom_elevated_button.dart';
// import '../../../../core/widgets/custom_text_field.dart';
// import '../../../../core/widgets/spacer_widget.dart';
// import '../providers/auth_provider.dart';
// import '../widgets/header_auth_widget.dart';
//
// class NewPasswordScreen extends StatefulWidget {
//   const NewPasswordScreen({super.key});
//
//   @override
//   State<NewPasswordScreen> createState() => _NewPasswordScreenState();
// }
//
// class _NewPasswordScreenState extends State<NewPasswordScreen> {
//   bool isEmptyPassword = true;
//   bool isEmptyConfirmPassword = true;
//   bool isObscure1 = true;
//   bool isObscure2 = true;
//
//   String? password;
//   String? confirmPassword;
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             SvgPicture.asset(AppIcons.loginBackground),
//             Padding(
//               padding: AppPadding.page,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const CustomBackButton(),
//                   const VerticalLargeSpacer(),
//                   const HeaderAuthWidget(title: 'new_password'),
//                   Form(
//                     key: _formKey,
//                     child: Column(
//                       children: [
//                         CustomTextFormField(
//                           hint: "enter_password",
//                           // prefixIcon: PrefixIconWidget(
//                           //   icon: Iconsax.lock,
//                           //   isEmpty: isEmptyPassword,
//                           // ),
//                           suffixIcon: IconButton(
//                             onPressed: isEmptyPassword
//                                 ? null
//                                 : () =>
//                                     setState(() => isObscure1 = !isObscure1),
//                             // onPressed: instance<LoginFunction>().toggleObscure,
//                             icon: isObscure1
//                                 ? Icon(
//                                     Iconsax.eye,
//                                     color:
//                                         isEmptyPassword ? AppColors.grey : null,
//                                   )
//                                 : const Icon(Iconsax.eye_slash),
//                           ),
//                           obscureText: isObscure1,
//                           keyboardType: TextInputType.visiblePassword,
//                           textInputAction: TextInputAction.done,
//                           validator: passwordValidation,
//                           onSave: (String? value) {
//                             password = value;
//                           },
//                           onChanged: (String? value) {
//                             setState(() {
//                               password = value;
//                               isEmptyPassword = (password?.isEmpty ?? true);
//                             });
//                           },
//                           initialValue: password,
//                         ),
//                         const VerticalLargeSpacer(),
//                         CustomTextFormField(
//                           hint: "re-enter_password",
//                           // prefixIcon: PrefixIconWidget(
//                           //   icon: Iconsax.lock,
//                           //   isEmpty: isEmptyConfirmPassword,
//                           // ),
//                           suffixIcon: IconButton(
//                             onPressed: isEmptyConfirmPassword
//                                 ? null
//                                 : () =>
//                                     setState(() => isObscure2 = !isObscure2),
//                             // onPressed: instance<LoginFunction>().toggleObscure,
//                             icon: isObscure2
//                                 ? Icon(
//                                     Iconsax.eye,
//                                     color: isEmptyConfirmPassword
//                                         ? AppColors.grey
//                                         : null,
//                                   )
//                                 : const Icon(Iconsax.eye_slash),
//                           ),
//                           obscureText: isObscure2,
//                           keyboardType: TextInputType.visiblePassword,
//                           textInputAction: TextInputAction.done,
//                           validator: (value) => confirmPasswordValidation(
//                             password: password,
//                             confirmPassword: value,
//                           ),
//                           onSave: (String? value) => confirmPassword = value,
//                           onChanged: (String? value) {
//                             setState(() {
//                               confirmPassword = value;
//                               isEmptyConfirmPassword =
//                                   confirmPassword?.isEmpty ?? true;
//                             });
//                           },
//                           initialValue: confirmPassword,
//                         ),
//                         const VerticalLargeSpacer(),
//                         CustomElevatedButton(
//                           isDisable: isAnyFieldEmpty,
//                           onPressed: () {
//                             if (_formKey.currentState?.validate() ?? false) {
//                               _formKey.currentState?.save();
//                               context.read<AuthProvider>().resetPassword(
//                                     password: password!,
//                                     onSuccess: () => context.pushReplacement(
//                                         const ResetPasswordSuccessScreen()),
//                                   );
//                             }
//                           },
//                           label: 'confirm_',
//                         ),
//                       ],
//                     ),
//                   ),
//                   const VerticalLargeSpacer(),
//                   const Spacer(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   bool get isAnyFieldEmpty {
//     if (isEmptyPassword || isEmptyConfirmPassword) {
//       return true;
//     }
//     return false;
//   }
// }
//
// void showSuccessChangePassword() {
//   final context = navContext;
//   showDialog(
//     context: context,
//     builder: (context) => Dialog(
//       child: Container(
//         height: 270.h,
//         padding: AppPadding.page,
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: AppRadius.card,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'تم تغيير كلمة السر بنجاح!',
//               style: context.displaySmall,
//             ),
//             const VerticalMediumSpacer(),
//             Text(
//               'يمكنك الآن تسجيل الدخول ومتابعة موادك الدراسية',
//               style: context.bodyLarge,
//             ),
//             const VerticalLargeSpacer(),
//             CustomElevatedButton(
//               label: 'login_',
//               onPressed: () => context.pushReplacementNamed(
//                 routeName: Routes.loginScreen,
//               ),
//             )
//           ],
//         ),
//       ),
//     ),
//   );
// }
