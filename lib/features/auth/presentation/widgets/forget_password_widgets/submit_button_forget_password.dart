import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/common/widgets/m_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/auth/auth_bloc.dart';

class SubmitButtonForgetPassword extends StatelessWidget {
  const SubmitButtonForgetPassword({
    super.key,
    required this.isLargeTablet,
    required this.emailController,
    required this.fontSize,
    required this.formKey,
  });

  final bool isLargeTablet;
  final TextEditingController emailController;
  final double fontSize;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isLargeTablet ? 300 : double.infinity,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthForgetPassSuccess) {
            Navigator.of(context).pushNamed(
              Routes.verfiyCode,
              arguments: {
                'email': emailController.text.trim(),
                'previousPage': Routes.forgetPassword,
                 'userData': null,
              },
            );
          }
          if (state is AuthForgetPassFailure) {
            MFunctions.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<AuthBloc>().add(
                      AuthForgetPassEvent(
                        email: emailController.text.trim(),
                      ),
                    );
              }
            },
            child: state is AuthforgetPassLoading
                ? const MLoader()
                : Text(
                    "Save".tr(context),
                    style: TextStyle(
                      fontSize: fontSize,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
