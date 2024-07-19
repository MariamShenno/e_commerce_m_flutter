// import 'package:e_commerce_m_flutter/init_dependecies.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../screens/login.dart';
// import 'auth/auth_bloc.dart';
// import 'password_visibility/password_visibility_cubit.dart';

// class AuthProvider extends StatelessWidget {
//   const AuthProvider({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthBloc>(
//           create: (context) => sl<AuthBloc>(),
//         ),
//          BlocProvider<PasswordVisibilityCubit>(
//           create: (context) => sl<PasswordVisibilityCubit>(),
//         ),
//       ],
//       child: const LogInScreen(),
//     );
//   }
// }
