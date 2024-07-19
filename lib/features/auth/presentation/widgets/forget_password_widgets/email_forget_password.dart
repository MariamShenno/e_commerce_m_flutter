import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';

class EmailForgetPassword extends StatelessWidget {
  const EmailForgetPassword({
    super.key,
    required this.emailController,
    required this.fontSize,
    required this.iconSize,
  });

  final TextEditingController emailController;
  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "email".tr(context),
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        hintText: "example@mail.com",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        prefixIcon: Icon(
          Iconsax.direct,
          size: iconSize,
        ),
      ),
      validator: (value) => MValidator.validateEmail(value,context),
    );
  }
}
