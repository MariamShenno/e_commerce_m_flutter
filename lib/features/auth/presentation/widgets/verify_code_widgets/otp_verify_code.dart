// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import '../../../../../common/utils/constants/colors.dart';
// import '../../../../../config/routes/routes.dart';

// class OtpVerifyCode extends StatelessWidget {
//   final String previousPage;
//   const OtpVerifyCode({super.key, required this.previousPage});

//   @override
//   Widget build(BuildContext context) {
//     //bool isLargeTablet = Responsive.isLargeTablet(context);

//     return OtpTextField(
//       fieldWidth: 50.0,
//       numberOfFields: 5,
//       borderColor: MColors.borderPrimary,
//       focusedBorderColor: MColors.darkGrey,
//       showFieldAsBox: true,
//       autoFocus: true,
//       onCodeChanged: (String code) {},
//       onSubmit: (String verificationCode) {
//         previousPage == Routes.forgetPassword
//             ? Navigator.of(context).pushNamed(Routes.resetPassword)
//             : Navigator.of(context).pushNamedAndRemoveUntil(
//                 Routes.registrationSuccess,
//                 (route) => false,
//               );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/widgets/m_responsive.dart';
import '../../bloc/auth/auth_bloc.dart';

class OtpVerifyCode extends StatelessWidget {
  const OtpVerifyCode({
    super.key,
    required this.email,
  });
  final String email;
  @override
  Widget build(BuildContext context) {
    final isTablet = MResponsive.isTablet(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return OtpTextField(
          fieldWidth: isTablet ? 100.0 : 50.0,
          numberOfFields: 5,
          borderColor: MColors.borderPrimary,
          focusedBorderColor: MColors.darkGrey,
          textStyle: isTablet
              ? Theme.of(context).textTheme.headlineLarge
              : Theme.of(context).textTheme.headlineMedium,
          showFieldAsBox: true,
          autoFocus: true,
          onSubmit: (String verificationCode) {
            context.read<AuthBloc>().add(
                  AuthVerifyCodeEvent(
                    email: email,
                    code: verificationCode,
                  ),
                );
          },
        );
      },
    );
  }
}
