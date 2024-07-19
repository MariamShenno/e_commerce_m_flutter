

import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/widgets/sign_up_widgets/email_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/m_loader.dart';
import '../../../../../common/widgets/m_responsive.dart';
import '../../../../../config/routes/routes.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';
import 'name_sign_up.dart';
import 'password_sign_up.dart';
import 'phone_sign_up.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController phoneController;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final dark = MFunctions.isDarkMode(context);
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double fontSize = isLargeTablet ? 20.0 : 16.0;

    return BlocProvider(
      create: (context) => SigUpPasswordVisibilityCubit(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignUpSuccess) {
            Navigator.of(context).pushNamed(
              Routes.verfiyCode,
              arguments: {
                'email': emailController.text.trim(),
                'previousPage': Routes.signUp,
                'userData': null,
              },
            );
          }
          if (state is AuthSignUpFailure) {
            MFunctions.showSnackBar(context, state.message);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                // Name
                NameSignUp(nameController: nameController),
                SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwInputFields
                      : MSizes.spaceBtwInputFields,
                ),
                EmailSignUp(emailController: emailController),
                SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwInputFields
                      : MSizes.spaceBtwInputFields,
                ),
                // Phone Number
                PhoneSignUp(phoneController: phoneController),
                SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwInputFields
                      : MSizes.spaceBtwInputFields,
                ),
                // Password
                PasswordSignUp(passwordController: passwordController),
                SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwSections
                      : MSizes.spaceBtwSections,
                ),
                // Create Account Button
                SizedBox(
                   width: isLargeTablet ? 300 : double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUpEvent(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                                phone: phoneController.text.trim(),
                              ),
                            );
                      }
                    },
                    child: state is AuthSignUpLoading
                        ? const MLoader()
                        : Text(
                           "createAccount".tr(context),
                            style: TextStyle(fontSize: fontSize),
                          ),
                  ),
                ),
                SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwItems
                      : MSizes.spaceBtwItems,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
