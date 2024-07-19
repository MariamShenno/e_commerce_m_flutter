// import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
// import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
// import 'package:e_commerce_m_flutter/common/utils/constants/text_strings.dart';
// import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
// import 'package:e_commerce_m_flutter/features/auth%20copy/presentation/screens/verify_code.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import '../../../../config/routes/routes.dart';
// import 'login.dart';

// class CheckEmailScreen extends StatelessWidget {
//   const CheckEmailScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             onPressed: () => Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const LogInScreen()),
//             ),
//             icon: const Icon(CupertinoIcons.clear),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(MSizes.defaultSpace),
//           child: Column(
//             children: [
//               /// Image
//               Image(
//                 image: const AssetImage(MImages.deliveredEmailIllustration),
//                 width: MFunctions.screenWidth(context) * 0.6,
//               ),
//               const SizedBox(
//                 height: MSizes.spaceBtwItems,
//               ),

//               /// Title / SubTitle
//               Text(
//                 MTexts.confirmEmail,
//                 style: Theme.of(context).textTheme.headlineMedium,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: MSizes.spaceBtwItems,
//               ),
//               Text(
//                 "support@gmail.com",
//                 style: Theme.of(context).textTheme.labelLarge,
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(
//                 height: MSizes.spaceBtwItems,
//               ),
//               Text(
//                 MTexts.confirmEmailSubTitle,
//                 style: Theme.of(context).textTheme.labelMedium,
//                 textAlign: TextAlign.center,
//               ),

//               ///  Buttons
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                    onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>  const VerifyCodeScreen(previousPage: Routes.verfiyCode,),
//                         ),
//                   ),
//                   child: const Text(MTexts.continues),
//                 ),
//               ),
//               const SizedBox(
//                 height: MSizes.spaceBtwItems,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(MTexts.resendEmail),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
