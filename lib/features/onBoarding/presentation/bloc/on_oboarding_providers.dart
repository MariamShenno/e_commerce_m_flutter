
import 'package:e_commerce_m_flutter/features/onBoarding/presentation/bloc/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:e_commerce_m_flutter/init_dependecies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/on_boarding_screen.dart';
import 'on_boarding_navigation_cubit/on_boarding_navigation_cubit.dart';

class OnBoardingProviders extends StatelessWidget {
  const OnBoardingProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnBoardingCubit>(
          create: (context)=> sl<OnBoardingCubit>(),
          ),
          BlocProvider<OnBoardingNavigationCubit>(
          create: (context)=> OnBoardingNavigationCubit(),
          ),
      ],
      child: const OnBoardingScreen(),
    );
  }
}