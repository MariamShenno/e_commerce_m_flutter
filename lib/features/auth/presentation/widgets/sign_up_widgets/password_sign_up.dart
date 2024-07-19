import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/utils/validators/validation.dart';
import '../../../../../common/widgets/m_responsive.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';

class PasswordSignUp extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordSignUp({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    final bool isLargeTablet = MResponsive.isLargeTablet(context);
    final double fontSize = isLargeTablet ? 20.0 : 16.0;
    final double iconSize = isLargeTablet ? 24.0 : 20.0;

    return BlocBuilder<SigUpPasswordVisibilityCubit, PasswordVisibilityState>(
      builder: (context, state) {
        return TextFormField(
          controller: passwordController,
          obscureText: state.isHidden,
          decoration: InputDecoration(
            labelText: "password".tr(context),
            labelStyle: TextStyle(
              fontSize: fontSize,
            ),
            prefixIcon: Icon(
              Iconsax.password_check,
              size: iconSize,
            ),
            suffixIcon: IconButton(
              onPressed: (){
               context.read<SigUpPasswordVisibilityCubit>().togglePasswordVisibility(); 
              },
             icon: Icon( state.isHidden ? Iconsax.eye_slash : Iconsax.eye,size: iconSize,),
              
            ),
          ),
          validator: (value) => MValidator.validatePassword(value, context),
        );
      },
    );
  }
}
