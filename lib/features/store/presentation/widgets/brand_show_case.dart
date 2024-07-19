import 'package:e_commerce_m_flutter/features/store/presentation/widgets/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../shop/presentation/widgets/product_cards_widgets/rounded_container.dart';

class MBrandShowCase extends StatelessWidget {
  const MBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MRoundedContainer(
      shadowBorder: true,
      borderColor: MColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(MSizes.md),
      margin: const EdgeInsets.only(bottom: MSizes.spaceBtwItems),
      child: Column(
        children: [
          // Brand with products count
          const MBrandCard(showBorder: false),
           const SizedBox(height: MSizes.spaceBtwItems),
          // Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: MRoundedContainer(
        height: 100,
        backgroundColor:
            MFunctions.isDarkMode(context) ? MColors.darkGrey : MColors.light,
        margin: const EdgeInsets.only(right: MSizes.md),
        padding: const EdgeInsets.all(MSizes.md),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
