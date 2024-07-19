import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/m_responsive.dart';
import '../bloc/on_boarding_navigation_cubit/on_boarding_navigation_cubit.dart';

class OnBoardingSkip extends StatelessWidget {
  final PageController pageController;
  const OnBoardingSkip({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    final isEnglish = MFunctions.isEnglish(context);
    return BlocBuilder<OnBoardingNavigationCubit, OnBoardingNavigationState>(
      builder: (context, state) {
        return Positioned(
          right: isEnglish ? MFunctions.screenWidth(context) * 0.05 : null,
          left: isEnglish ? null : MFunctions.screenWidth(context) * 0.05,
          top: MFunctions.screenHeight(context) * 0.05,
          child: AnimatedOpacity(
            opacity: state.currentPage! == 2 ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: TextButton(
              onPressed: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                );
              },
              child: Text(
                "skip".tr(context),
                style: MResponsive.isTablet(context)
                    ? Theme.of(context).textTheme.headlineMedium
                    : Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        );
      },
    );
  }
}
