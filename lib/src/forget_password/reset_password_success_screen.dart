// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:jawab/core/extension/context_extension.dart';
//
// import '../../../../core/routes/app_routes.dart';
// import '../../../../core/utils/app_styles.dart';
// import '../../../../core/widgets/custom_elevated_button.dart';
// import '../../../../core/widgets/spacer_widget.dart';
//
// class ResetPasswordSuccessScreen extends StatelessWidget {
//   const ResetPasswordSuccessScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: AppPadding.page,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const VerticalExtraLargeSpacer(),
//               const VerticalExtraLargeSpacer(),
//               const VerticalExtraLargeSpacer(),
//               Text(
//                 'password_changed_successfully'.tr(),
//                 style: context.headlineMedium,
//               ),
//               const VerticalLargeSpacer(),
//               Text(
//                 'now_you_can_login'.tr(),
//                 style: context.bodyLarge,
//               ),
//               const VerticalExtraLargeSpacer(),
//               CustomElevatedButton(
//                 label: 'login_',
//                 onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
//                   Routes.loginScreen,
//                   (route) => false,
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
