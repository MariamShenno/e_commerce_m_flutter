import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';

class ConfirmPassword extends StatelessWidget {
  const ConfirmPassword({
    super.key,
    required this.confirmPasswordController,
    required this.iconSize,
    required this.fontSize,
    required this.newPasswordController,
  });

  final TextEditingController confirmPasswordController;
  final double iconSize;
  final double fontSize;
  final TextEditingController newPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmPassVisibilityCubit, PasswordVisibilityState>(
        builder: (context, state) {
      return TextFormField(
        controller: confirmPasswordController,
        obscureText: state.isHidden,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Iconsax.password_check,
            size: iconSize,
          ),
          labelText: "confirmPassword".tr(context),
          labelStyle: TextStyle(
            fontSize: fontSize,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              context
                  .read<ConfirmPassVisibilityCubit>()
                  .togglePasswordVisibility();
            },
            icon: Icon(state.isHidden ? Iconsax.eye_slash : Iconsax.eye),
          ),
        ),
        validator: (value) => MValidator.validatePassword(value, context),
      );
    });
  }
}
