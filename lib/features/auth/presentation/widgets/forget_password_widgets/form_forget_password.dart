import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/sizes.dart';
import 'email_forget_password.dart';
import 'submit_button_forget_password.dart';

class FormForgetPassword extends StatefulWidget {
  const FormForgetPassword({
    super.key, required double fontSize, required bool isLargeTablet, required double mediumFontSize, required double iconSize,
  });

  @override
  State<FormForgetPassword> createState() => _FormForgetPasswordState();
}

class _FormForgetPasswordState extends State<FormForgetPassword> {
  late final TextEditingController emailController;
  late final GlobalKey<FormState> formKey;
  late final double fontSize;
  late final bool isLargeTablet;
  late final double mediumFontSize;
  late final double iconSize;
  @override
  void initState() {
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Heading
          Text(
            "forgetPasswordTitle".tr(context),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: fontSize,
                ),
          ),
          SizedBox(
            height:
                isLargeTablet ? 2 * MSizes.spaceBtwItems : MSizes.spaceBtwItems,
          ),
          Text(
            "forgetPasswordSubTitle".tr(context),
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: mediumFontSize,
                ),
          ),
          SizedBox(
            height: isLargeTablet
                ? 4 * MSizes.spaceBtwItems
                : 2 * MSizes.spaceBtwItems,
          ),

          /// Text field
          EmailForgetPassword(
              emailController: emailController,
              fontSize: fontSize,
              iconSize: iconSize,
              ),

          SizedBox(
            height:
                isLargeTablet ? 2 * MSizes.spaceBtwItems : MSizes.spaceBtwItems,
          ),

          /// Submit Button
          SubmitButtonForgetPassword(
            isLargeTablet: isLargeTablet,
            emailController: emailController,
            fontSize: fontSize,
            formKey: formKey,
          ),
          SizedBox(
            height:
                isLargeTablet ? 2 * MSizes.spaceBtwItems : MSizes.spaceBtwItems,
          ),
        ],
      ),
    );
  }
}
