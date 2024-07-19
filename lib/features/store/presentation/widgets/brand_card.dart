
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/enums.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/brand/m_brand_title_with_verified_icon.dart';
import '../../../../common/widgets/images/m_circular_image.dart';
import '../../../shop/presentation/widgets/product_cards_widgets/rounded_container.dart';

class MBrandCard extends StatelessWidget {
  const MBrandCard({
    super.key, required this.showBorder, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // Container Design
      child: MRoundedContainer(
        padding: const EdgeInsets.all(MSizes.sm),
        shadowBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // Icon
            Flexible(
              child: MCircularImage(
                isNetworkImage: false,
                image: MImages.electronicsIcon,
                backgroundColor: Colors.transparent,
                overlayColor:
                    MFunctions.isDarkMode(context)
                        ? MColors.white
                        : MColors.black,
              ),
            ),
            const SizedBox(
                width: MSizes.spaceBtwItems / 2),
    
            // Text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const MBrandTitleWithVerifiedIcon(
                      title: 'Iphone',
                      brandTextSizes: TextSize.large),
                  Text(
                    "256 Products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
