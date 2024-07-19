import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/m_responsive.dart';

class EmailSignUp extends StatelessWidget {
  final TextEditingController emailController;

  const EmailSignUp({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    final bool isLargeTablet = MResponsive.isLargeTablet(context);
    final double fontSize = isLargeTablet ? 20.0 : 16.0;
    final double iconSize = isLargeTablet ? 24.0 : 20.0;

    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        labelText: "email".tr(context),
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        prefixIcon: Icon(
          Iconsax.direct,
          size: iconSize,
        ),
        hintText: "example@mail.com",
        hintStyle: Theme.of(context).textTheme.labelMedium,
      ),
      validator: (value) => MValidator.validateEmail(value, context),
    );
  }
}
