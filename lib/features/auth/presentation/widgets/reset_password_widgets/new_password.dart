import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/common/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../bloc/password_visibility/password_visibility_cubit.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({
    super.key,
    required this.newPasswordController,
    required this.iconSize,
    required this.fontSize,
  });

  final TextEditingController newPasswordController;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewPassVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
      return TextFormField(
        controller: newPasswordController,
        obscureText: state.isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Iconsax.password_check,
            size: iconSize,
          ),
          labelText: "newPassword".tr(context),
          labelStyle: TextStyle(
            fontSize: fontSize,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              context.read<NewPassVisibilityCubit>().togglePasswordVisibility();
            },
            icon: Icon(
              state.isHidden ? Iconsax.eye_slash : Iconsax.eye,
              size: iconSize,
            ),
          ),
        ),
        validator: (value) => MValidator.validatePassword(value, context),
      );
    });
  }
}
