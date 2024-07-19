import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/utils/functions/functions.dart';
import '../widgets/log_in_widgets/login_form.dart';
import '../widgets/log_in_widgets/login_header.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: MSizes.appBarWeight,
            left: MSizes.defaultSpace,
            bottom: MSizes.defaultSpace,
            right: MSizes.defaultSpace,
          ),
          child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Logo, Title, Sub-Title
                  LoginHeader(dark: dark),
              
                  /// Form
                  const LoginForm(),
                ],
              ),
           
        ),
      ),
    );
  }
}
