import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:e_commerce_m_flutter/features/onBoarding/presentation/bloc/on_boarding_navigation_cubit/on_boarding_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/on_boarding_cubit/on_boarding_cubit.dart';
import '../widgets/onboarding_dot_indecator.dart';
import '../widgets/onboarding_next_button.dart';
import '../widgets/onboarding_page.dart';
import '../widgets/onboarding_skip.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    context.read<OnBoardingCubit>().getOnBoardingList();
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Horzintal Scrollable Pages
          BlocBuilder<OnBoardingCubit, OnBoardingState>(
            buildWhen: (previous, current) =>
                previous.onBoardingList != current.onBoardingList,
            builder: (context, state) {
              final list = state.onBoardingList!;
              return PageView(
                controller: _pageController,
                onPageChanged: (value) {
                  context
                      .read<OnBoardingNavigationCubit>()
                      .onPageChanged(value);
                },
                children: [
                  OnBoardingPage(
                    image: MImages.onBoardingImage1,
                    title: list[0].title.tr(context),
                    description: list[0].description.tr(context),
                  ),
                  OnBoardingPage(
                    image: MImages.onBoardingImage2,
                    title: list[1].title.tr(context),
                    description: list[1].description.tr(context),
                  ),
                  OnBoardingPage(
                    image: MImages.onBoardingImage3,
                    title: list[2].title.tr(context),
                    description: list[2].description.tr(context),
                  ),
                ],
              );
            },
          ),

          // Skip Button
          OnBoardingSkip(pageController: _pageController),

          // OnBoarding DotIndicator
          OnBoardingDotIndicator(pageController: _pageController),
          // Circular Button
          OnBoardingNextButton(pageController: _pageController),
        ],
      ),
    );
  }
}
