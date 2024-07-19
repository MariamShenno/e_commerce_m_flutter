import 'package:e_commerce_m_flutter/common/utils/constants/enums.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:e_commerce_m_flutter/common/widgets/brand/m_brand_title_with_verified_icon.dart';
import 'package:e_commerce_m_flutter/common/widgets/products/m_product_title_text.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/product_cards_widgets/product_price_text.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/product_cards_widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../common/utils/constants/colors.dart';
import '../../../common/utils/constants/sizes.dart';
import '../../../common/widgets/images/m_circular_image.dart';

class MProductMetaData extends StatelessWidget {
  const MProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return Column(
      children: [
        /// Price and Sale Price
        Row(
          children: [
            // Sale tag
            MRoundedContainer(
              raduis: MSizes.sm,
              backgroundColor: MColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: MSizes.sm, vertical: MSizes.xs),
              child: Text(
                "25%",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: MColors.black),
              ),
            ),
            const SizedBox(width: MSizes.spaceBtwItems),
            // Price
            Text(
              "\$250",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: MSizes.spaceBtwItems),
            const MProductPriceText(price: "175", isLarge: true),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 1.5),
        // Title
        const MProductTitleText(title: "Mobile"),
        const SizedBox(height: MSizes.spaceBtwItems / 1.5),
        // Stock Status
        Row(
          children: [
            const MProductTitleText(title: "Status"),
            const SizedBox(width: MSizes.spaceBtwItems),
            Text("In Stock", style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: MSizes.spaceBtwItems / 1.5),
        // Brand
        Row(
          children: [
            MCircularImage(
              image: MImages.electronicsIcon,
              width: 32,
              height: 32,
              overlayColor: dark ? MColors.white : MColors.black,
            ),
            const MBrandTitleWithVerifiedIcon(
                title: "Iphone", brandTextSizes: TextSize.medium),
          ],
        ),
      ],
    );
  }
}
