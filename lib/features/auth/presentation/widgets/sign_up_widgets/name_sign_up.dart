import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/m_responsive.dart';

class NameSignUp extends StatelessWidget {
  final TextEditingController nameController;

  const NameSignUp({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    final bool isLargeTablet = MResponsive.isLargeTablet(context);
    final double fontSize = isLargeTablet ? 20.0 : 16.0;
    final double iconSize = isLargeTablet ? 24.0 : 20.0;

    return TextFormField(
      controller: nameController,
      expands: false,
      decoration: InputDecoration(
        labelText: "username".tr(context),
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        prefixIcon: Icon(
          Iconsax.user,
          size: iconSize,
        ),
      ),
      validator: (value) => MValidator.validateName(value, context),
    );
  }
}
