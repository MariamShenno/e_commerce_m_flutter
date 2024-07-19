import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import '../widgets/sign_up_widgets/signup_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = MFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text( 
                "signupTitle".tr(context),
                style: Theme.of(context).textTheme.headlineMedium,
              ),

              /// Form
              const SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}
