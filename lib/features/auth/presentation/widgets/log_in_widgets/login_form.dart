import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/config/routes/routes.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/widgets/log_in_widgets/email_log_in.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/widgets/log_in_widgets/password_log_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/utils/functions/functions.dart';
import '../../../../../common/widgets/m_loader.dart';
import '../../../../../common/widgets/m_responsive.dart';
import '../../../../../core/cubits/middleware/middleware_cubit.dart';
import '../../../../../init_dependecies.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/password_visibility/password_visibility_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController emailController;

  late final TextEditingController passwordController;

  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void isUserVerified(AuthSignInSuccess state, BuildContext context) {
    // final userData = {
    //   "id": state.user.id,
    //   "name": state.user.name,
    //   "email": state.user.email,
    //   "phone": state.user.phone,
    // };

    if (state.user.approved == 0) {
      Navigator.of(context).pushNamed(
        Routes.verfiyCode,
        arguments: {
          'email': emailController.text.trim(),
          'previousPage': Routes.login,
          'userData': state.user,
        },
      );
    } else {
      /////change to home page
      context
          .read<MiddlewareCubit>()
          .changeMiddleWarePage(Routes.registrationSuccess);
      // save user to local storage
      //sl<Box>().put("currentUser", userData);
      sl<SharedPreferences>().setInt("id", state.user.id);
      sl<SharedPreferences>().setString("email", state.user.email);
      sl<SharedPreferences>().setString("name", state.user.name);
      sl<SharedPreferences>().setString("phone", state.user.phone);
      Navigator.of(context).pushNamedAndRemoveUntil(
        /////change to home page
        Routes.registrationSuccess,
        (route) => false,
      );
    
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    double iconSize = isLargeTablet ? 24.0 : 20.0;
    return BlocProvider(
      create: (context) => LogInPasswordVisibilityCubit(),
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: isLargeTablet
                  ? 2 * MSizes.spaceBtwSections
                  : MSizes.spaceBtwSections),
          child: Column(
            children: [
              /// Email
              EmailLogIn(
                  emailController: emailController,
                  iconSize: iconSize,
                  fontSize: fontSize),
              SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwInputFields
                    : MSizes.spaceBtwInputFields,
              ),

              /// Password
              PasswordLogIn(
                  passwordController: passwordController,
                  iconSize: iconSize,
                  fontSize: fontSize),

              SizedBox(
                height: isLargeTablet
                    ? MSizes.spaceBtwInputFields
                    : MSizes.spaceBtwInputFields / 2,
              ),

              /// Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Forget Password
                  Flexible(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pushNamed(
                        Routes.forgetPassword,
                      ),
                      child: Text(
                        "forgetPassword".tr(context),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwSections
                      : MSizes.spaceBtwSections),

              /// Log In Button
              SizedBox(
                width: isLargeTablet ? 300 : double.infinity,
                child: BlocConsumer<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is AuthSignInSuccess) {
                      /// user approve
                      isUserVerified(state, context);
                    }
                    if (state is AuthSignInFailure) {
                      //state.message
                      MFunctions.showSnackBar(context, state.message);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        // Auth Bloc
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                AuthSignInEvent(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      child: state is AuthSignInLoading
                          ? const MLoader()
                          : Text(
                              "logIn".tr(context),
                              style: TextStyle(fontSize: fontSize),
                            ),
                    );
                  },
                ),
              ),
              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwItems
                      : MSizes.spaceBtwItems),

              /// Create Account Button
              SizedBox(
                width: isLargeTablet ? 300 : double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.signUp);
                  },
                  child: Text(
                    "createAccount".tr(context),
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),

              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwSections
                      : MSizes.spaceBtwSections),
            ],
          ),
        ),
      ),
    );
  }
}
