//
// import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
//
// import '../utils/app_colors.dart';
//
// Future<bool?> myDialogWidget(BuildContext context,String title ){
//   return Alert(
//     context: context,
//     type: AlertType.warning,
//     title:title,
//     buttons: [
//       DialogButton(
//         onPressed: () =>
//             Navigator.pop(context),
//         color: AppColors.buttonBackground,
//         child:  Text(translateText(AppStrings.cancelBtn,context),
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 20),
//         ),
//       ),
//       DialogButton(
//         onPressed: () =>
//             Navigator.of(context)
//                 .push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return const LoginScreen();
//                 },
//               ),
//             ),
//         color: AppColors.error,
//         child:  Text(
//           translateText(AppStrings.loginText,context),
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 20),
//         ),
//       )
//     ],
//   ).show();
// }