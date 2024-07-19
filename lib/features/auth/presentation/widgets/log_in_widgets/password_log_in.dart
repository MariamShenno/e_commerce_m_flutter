import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';

class PasswordLogIn extends StatelessWidget {
  const PasswordLogIn({
    super.key,
    required this.passwordController,
    required this.iconSize,
    required this.fontSize,
  });

  final TextEditingController passwordController;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogInPasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
        obscureText: state.isHidden,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Iconsax.password_check,
              size: iconSize,
            ),
            labelText: "password".tr(context),
            labelStyle: TextStyle(
              fontSize: fontSize,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                context
                    .read<LogInPasswordVisibilityCubit>()
                    .togglePasswordVisibility();
              },
              icon: Icon(
                state.isHidden ? Iconsax.eye_slash : Iconsax.eye,
                size: iconSize,
              ),
            ),
          ),
          validator: (value) => MValidator.validatePassword(value, context),
        );
      },
    );
  }
}
