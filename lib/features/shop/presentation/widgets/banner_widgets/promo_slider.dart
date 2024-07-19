// MPromoSlider widget
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/widgets/custom_shapes/m_circular_container.dart';
import '../../../../../common/widgets/images/m_rounded_image.dart';
import '../../bloc/home_page_indicator/home_page_indicator_cubit.dart';

class MPromoSlider extends StatefulWidget {
  const MPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  _MPromoSliderState createState() => _MPromoSliderState();
}

class _MPromoSliderState extends State<MPromoSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageIndicatorCubit(),
      child: Column(
        children: [
          BlocBuilder<HomePageIndicatorCubit, int>(
            builder: (context, currentIndex) {
              _controller.reset();
              _controller.forward();

              return Column(
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, _) {
                        context
                            .read<HomePageIndicatorCubit>()
                            .updatePageIndicator(index);
                      },
                    ),
                    // items: widget.banners
                    //     .map((url) => Padding(
                    //           padding:
                    //               const EdgeInsets.symmetric(horizontal: 10.0),
                    //           child: MRoundedImage(imageUrl: url),
                    //         ))
                    //     .toList(), 
                    itemCount: widget.banners.length,
                    itemBuilder: (context, index, currentIndex) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _animation.value,
                              child: MRoundedImage(
                                  // height: 150,
                                  // width: 150,
                                  fit: BoxFit.cover,
                                  imageUrl: widget.banners[index]),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < widget.banners.length; i++)
                          MCircularConatiner(
                            width: 20,
                            height: 4,
                            margin: const EdgeInsets.only(right: 10),
                            backgroundColor: i == currentIndex
                                ? Colors.orangeAccent
                                : Colors.grey,
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
