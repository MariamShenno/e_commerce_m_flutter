import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/image_strings.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/appbar/m_app_bar.dart';
import '../../../common/widgets/icons/m_circular_icon.dart';
import '../../../common/widgets/images/m_rounded_image.dart';
import '../../shop/presentation/widgets/container_widgets/curved_edges_widget.dart';

class MProductImageSlider extends StatelessWidget {
  const MProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return MCurvedEdgesWidget(
      child: Container(
        color: dark ? MColors.darkGrey : MColors.light,
        child: Stack(
          children: [
            // Main Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(MSizes.productImageRadius * 2),
                child: Center(
                  child: Image.asset(MImages.productImage71),
                ),
              ),
            ),
            // Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: MSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: 6,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                      const SizedBox(width: MSizes.spaceBtwItems),
                  itemBuilder: (_, index) => MRoundedImage(
                    width: 80,
                    backgroundColor: dark ? MColors.dark : MColors.white,
                    border: Border.all(color: MColors.primary),
                    padding: const EdgeInsets.all(MSizes.sm),
                    imageUrl: MImages.productImage72,
                  ),
                ),
              ),
            ),
            //Appbar Icons
            const MAppBar(
              showBackArrow: true,
              actions: [
                MCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
