import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/m_responsive.dart';
import '../widgets/forget_password_widgets/form_forget_password.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double mediumFontSize = isLargeTablet ? 18.0 : 14.0;
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    double iconSize = isLargeTablet ? 24.0 : 20.0;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(MSizes.defaultSpace),
        child: FormForgetPassword(
          fontSize: fontSize,
          isLargeTablet: isLargeTablet,
          mediumFontSize: mediumFontSize,
          iconSize: iconSize,
        ),
      ),
    );
  }
}
