import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/m_responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';
import 'confirm_password.dart';
import 'new_password.dart';

class ResetPasswordForm extends StatefulWidget {
  final double iconSize;
  final double fontSize;
  final String email;

  const ResetPasswordForm({
    super.key,
    required this.iconSize,
    required this.fontSize,
    required this.email,
  });

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewPassVisibilityCubit()),
        BlocProvider(create: (context) => ConfirmPassVisibilityCubit()),
      ],
      child: Form(
        key: formKey,
        child: Column(
          children: [
            /// New Password
            NewPassword(
              newPasswordController: newPasswordController,
              iconSize: widget.iconSize,
              fontSize: widget.fontSize,
            ),
            SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwItems
                    : MSizes.spaceBtwItems),

            /// Confirm Password
            ConfirmPassword(
              confirmPasswordController: confirmPasswordController,
              iconSize: widget.iconSize,
              fontSize: widget.fontSize,
              newPasswordController: newPasswordController,
            ),
            SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwItems
                    : MSizes.spaceBtwItems),

            /// Save Button
            Center(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthBloc>().add(
                            AuthResetPassEvent(
                              email: widget.email,
                              newPassword: newPasswordController.text.trim(),
                              confirmPassword:
                                  confirmPasswordController.text.trim(),
                            ),
                          );
                    }
                  },
                  child: BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthResetPassSuccess) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          Routes.login,
                          (route) => false,
                        );
                        MFunctions.showSnackBar(
                            context, "ResetPasswordSuccessfully".tr(context));
                      }
                      if (state is AuthResetPassFailure) {
                        MFunctions.showSnackBar(context, state.message);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthRestPassLoading) {
                        return const CircularProgressIndicator();
                      }
                      return Text(
                        "save".tr(context),
                        style: TextStyle(fontSize: widget.fontSize),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
