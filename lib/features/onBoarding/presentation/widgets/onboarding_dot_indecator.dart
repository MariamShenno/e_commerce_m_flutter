import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';

class OnBoardingDotIndicator extends StatelessWidget {
  const OnBoardingDotIndicator({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    final isEnglish = MFunctions.isEnglish(context);

    return Positioned(
      left: isEnglish ? MFunctions.screenWidth(context) * 0.05 : null,
      right: isEnglish ? null : MFunctions.screenWidth(context) * 0.05,
      bottom: kBottomNavigationBarHeight,
      child: SmoothPageIndicator(
        controller: pageController,
        effect: SwapEffect(
            type: SwapType.yRotation,
            dotHeight: 4.0,
            dotWidth: MSizes.defaultSpace,
            activeDotColor: dark ? MColors.light : MColors.dark),
        count: 3,
        textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
      ),
    );
  }
}
