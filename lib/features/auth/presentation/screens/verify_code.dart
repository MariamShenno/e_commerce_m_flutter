import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/m_responsive.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/cubits/middleware/middleware_cubit.dart';
import '../../../../init_dependecies.dart';
import '../../domain/entities/user.dart';
import '../bloc/timer/timer_cubit.dart';
import '../widgets/custom_text_body.dart';
import '../widgets/custom_text_title.dart';
import '../widgets/verify_code_widgets/logo_image_verify_code.dart';
import '../widgets/verify_code_widgets/otp_verify_code.dart';
import '../widgets/verify_code_widgets/resend_otp_verify_code.dart';



// class VerifyCodeScreen extends StatelessWidget {
//   final String previousPage;
//   final String email;
//   final User? userData;

//   const VerifyCodeScreen({
//     super.key,
//     required this.previousPage,
//     required this.email,
//     this.userData,
//   });

//   @override
//   Widget build(BuildContext context) {
//     bool isLargeTablet = Responsive.isLargeTablet(context);
//     //double smallFontSize = isLargeTablet ? 16.0 : 12.0;
//     return BlocProvider(
//       create: (context) => TimerCubit()..startTimer(),
//       child: Scaffold(
//         body: BlocListener<AuthBloc, AuthState>(
//           listener: (context, state) {
//             if (state is AuthVerifyCodeSuccess) {
//               context.read<TimerCubit>().stopTimer();
//               checkPreviousPage(context);
//             }
//             if (state is AuthVerifyCodeFailure) {
//               MFunctions.showSnackBar(context, state.message);
//             }
//             if (state is AuthResendCodeFailure) {
//               MFunctions.showSnackBar(context, state.message);
//             }
//             if (state is AuthResendCodeSuccess) {
//               MFunctions.showSnackBar(
//                   context, "Has been Resend Message Successful");
//             }
//           },
//           child: Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 vertical: isLargeTablet ? 30 : 15,
//                 horizontal: isLargeTablet ? 60 : 30,
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Image placeholder
//                   LogoImage(isLargeTablet: isLargeTablet),
//                   SizedBox(height: isLargeTablet ? 40 : 20),
//                   const CustomTextTitle(
//                     text: "Verification Code",
//                   ),
//                   SizedBox(height: isLargeTablet ? 20 : 10),
//                   CustomTextBody(
//                     text: "Please Enter the Digit Code Sent to $email",
//                   ),
//                   SizedBox(height: isLargeTablet ? 30 : 25),
//                   //OTP Text Field
//                   OtpVerifyCode(email: email),
//                   SizedBox(height: isLargeTablet ? 60 : 30),
//                   // Timer
//                   Center(
//                     child: BlocBuilder<TimerCubit, int>(
//                         builder: (context, timerState) {
//                       return Text(
//                         "00: ${timerState.toString().padLeft(2, '0')}",
//                         style: Theme.of(context).textTheme.headlineSmall,
//                       );
//                     }),
//                   ),
//                   SizedBox(height: isLargeTablet ? 60 : 30),
//                   // Resend OTP
//                   ResendOtp(email: email),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void checkPreviousPage(BuildContext context) {
//     if (previousPage == Routes.login) {
//       context
//           .read<MiddlewareCubit>()
//           /////// update after create home page
//           .changeMiddleWarePage(Routes.registrationSuccess);
//       // save user to local storage
//      // sl<Box>().put("currentUser", userData);
//            sl<SharedPreferences>().setInt("id", userData!.id);
//       sl<SharedPreferences>().setString("email", userData!.email);
//       sl<SharedPreferences>().setString("name", userData!.name);
//       sl<SharedPreferences>().setString("phone", userData!.phone);
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         Routes.login,
//         (route) => false,
//       );
//     } else if (previousPage == Routes.forgetPassword) {
//       Navigator.of(context).pushReplacementNamed(
//         Routes.resetPassword,
//         arguments: email,
//       );
//     } else {
//       Navigator.of(context).pushNamedAndRemoveUntil(
//         Routes.login,
//         (route) => false,
//       );
//       MFunctions.showSnackBar(
//           context, "your Account Created Successfully".tr(context));
//     }
//   }
// }
class VerifyCodeScreen extends StatelessWidget {
  final String previousPage;
  final String email;
  final User? userData;

  const VerifyCodeScreen({
    super.key,
    required this.previousPage,
    required this.email,
    this.userData,
  });

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    return BlocProvider(
      create: (context) => TimerCubit()..startTimer(),
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthVerifyCodeSuccess) {
              context.read<TimerCubit>().stopTimer();
              checkPreviousPage(context);
            }
            if (state is AuthVerifyCodeFailure) {
              MFunctions.showSnackBar(context, state.message);
            }
            if (state is AuthResendCodeFailure) {
              MFunctions.showSnackBar(context, state.message);
            }
            if (state is AuthResendCodeSuccess) {
              MFunctions.showSnackBar(context, "Has been Resend Code Message Successful".tr(context));
            }
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: isLargeTablet ? 30 : 15,
                horizontal: isLargeTablet ? 60 : 30,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LogoImage(isLargeTablet: isLargeTablet),
                  SizedBox(height: isLargeTablet ? 40 : 20),
                  const CustomTextTitle(text: "Verification Code"),
                  SizedBox(height: isLargeTablet ? 20 : 10),
                  CustomTextBody(text: "Please Enter the Digit Code Sent to $email"),
                  SizedBox(height: isLargeTablet ? 30 : 25),
                  OtpVerifyCode(email: email),
                  SizedBox(height: isLargeTablet ? 60 : 30),
                  Center(
                    child: BlocBuilder<TimerCubit, int>(builder: (context, timerState) {
                      return Text("00: ${timerState.toString().padLeft(2, '0')}",
                          style: Theme.of(context).textTheme.headlineSmall);
                    }),
                  ),
                  SizedBox(height: isLargeTablet ? 60 : 30),
                  ResendOtp(email: email),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkPreviousPage(BuildContext context) {
    if (previousPage == Routes.login) {
      context.read<MiddlewareCubit>()
          .changeMiddleWarePage(Routes.registrationSuccess);
      sl<SharedPreferences>().setInt("id", userData!.id);
      sl<SharedPreferences>().setString("email", userData!.email);
      sl<SharedPreferences>().setString("name", userData!.name);
      sl<SharedPreferences>().setString("phone", userData!.phone);
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
    } else if (previousPage == Routes.forgetPassword) {
      Navigator.of(context).pushReplacementNamed(
        Routes.resetPassword,
        arguments: email,
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.login,
        (route) => false,
      );
      MFunctions.showSnackBar(context, "your Account Created Successfully".tr(context));
    }
  }
}
