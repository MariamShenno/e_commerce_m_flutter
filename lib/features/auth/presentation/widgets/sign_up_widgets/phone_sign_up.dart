import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/m_responsive.dart';

class PhoneSignUp extends StatelessWidget {
  final TextEditingController phoneController;

  const PhoneSignUp({super.key, required this.phoneController});

  @override
  Widget build(BuildContext context) {
    final bool isLargeTablet = MResponsive.isLargeTablet(context);
    final double fontSize = isLargeTablet ? 20.0 : 16.0;
    final double iconSize = isLargeTablet ? 24.0 : 20.0;

    return TextFormField(
      controller: phoneController,
      decoration: InputDecoration(
        labelText: "phoneNo".tr(context),
        labelStyle: TextStyle(
          fontSize: fontSize,
        ),
        prefixIcon: Icon(
          Iconsax.call,
          size: iconSize,
        ),
      ),
      validator: (value) => MValidator.validatePhoneNumber(value, context),
    );
  }
}
