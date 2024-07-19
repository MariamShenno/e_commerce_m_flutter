import 'package:flutter/material.dart';

import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/m_responsive.dart';

class OnBoardingPage extends StatelessWidget {
  final String title, description, image;

  const OnBoardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(MSizes.defaultSpace),
      child:SingleChildScrollView(
        child: Column(
          children: [
            Image(
              width: MFunctions.screenWidth(context) * 0.8,
              height: MFunctions.screenHeight(context) * 0.6,
              image: AssetImage(image),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: MSizes.spaceBtwItems,
            ),
            Text(
              description,
              style: MResponsive.isTablet(context)
                  ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 25,
                      )
                  : Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
