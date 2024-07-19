import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/utils/constants/colors.dart';
import '../../../../config/routes/routes.dart';
import '../../../../core/cubits/middleware/middleware_cubit.dart';
import '../bloc/on_boarding_navigation_cubit/on_boarding_navigation_cubit.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final isEnglish = MFunctions.isEnglish(context);
    final dark = MFunctions.isDarkMode(context);
    return BlocBuilder<OnBoardingNavigationCubit, OnBoardingNavigationState>(
      builder: (context, state) {
        return Positioned(
          right: isEnglish ? MFunctions.screenWidth(context) * 0.05 : null,
          left: isEnglish ? null : MFunctions.screenWidth(context) * 0.05,
          bottom: kBottomNavigationBarHeight,
          child: AnimatedOpacity(
            opacity: state.currentPage == 2 ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: dark ? MColors.primary : MColors.black,
              ),
              onPressed: () {
                if (state.currentPage == 2) {
                  Navigator.of(context).pushNamed(Routes.login);
                  context
                      .read<MiddlewareCubit>()
                      .changeMiddleWarePage(Routes.login);
                } else {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeIn);
                }
              },
              child: Icon(
                  isEnglish ? Iconsax.arrow_right_3 : Iconsax.arrow_left_2),
            ),
          ),
        );
      },
    );
  }
}
