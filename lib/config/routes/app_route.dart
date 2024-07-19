import 'package:e_commerce_m_flutter/config/routes/routes.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/screens/forget_password.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/screens/login.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/screens/reset_password.dart';
import 'package:e_commerce_m_flutter/features/auth/presentation/screens/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/registration_success.dart';
import '../../features/auth/presentation/screens/verify_code.dart';
import '../../features/onBoarding/presentation/bloc/on_oboarding_providers.dart';
import '../../features/navigation_menu.dart';

class AppRoute {
  const AppRoute._(); //private constructor to avoid creating an instance

  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // OnBoarding Page
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingProviders());
      // Auth Pages
      case Routes.login:
        return CupertinoPageRoute(builder: (_) => const LogInScreen());
      case Routes.signUp:
        return CupertinoPageRoute(
            fullscreenDialog: true, builder: (_) => const SignUpScreen());
      case Routes.forgetPassword:
        return CupertinoPageRoute(builder: (_) => const ForgetPassword());
      case Routes.resetPassword:
        final String email = routeSettings.arguments as String? ?? '';
        return CupertinoPageRoute(builder: (_) => ResetPassword(email: email));
      case Routes.verfiyCode:
        final args = routeSettings.arguments as Map<String, dynamic>?;
        if (args == null ||
            !args.containsKey('email') ||
            !args.containsKey('previousPage')) {
          return null;
        }
        return CupertinoPageRoute(
            builder: (_) => VerifyCodeScreen(
                  email: args['email']!,
                  previousPage: args['previousPage']!,
                  userData: args['userData'],
                ));
      case Routes.registrationSuccess:
        return CupertinoPageRoute(
            builder: (_) => const RegistrationSuccessScreen());
      // Home Page
      case '/':
        return MaterialPageRoute(builder: (_) => const NavigationMenu());
      default:
        return null;
    }
  }
}
