
import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';

class EmailLogIn extends StatelessWidget {
  const EmailLogIn({
    super.key,
    required this.emailController,
    required this.iconSize,
    required this.fontSize,
  });

  final TextEditingController emailController;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Iconsax.direct_right,
          size: iconSize,
        ),
        labelText: "email".tr(context),
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        hintText: "example@mail.com",
          hintStyle: Theme.of(context).textTheme.labelMedium,
      ),
      validator: (value) => MValidator.validateEmail(value, context),
    );
  }
}
