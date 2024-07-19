import 'package:e_commerce_m_flutter/common/styles/shadows.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/colors.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:e_commerce_m_flutter/common/widgets/images/m_rounded_image.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/product_cards_widgets/product_price_text.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/product_cards_widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/m_circular_icon.dart';
import '../../../../../common/widgets/products/m_product_title_text.dart';
import '../../../../product_details/screen/product_details.dart';

class MProductCardVertical extends StatelessWidget {
  const MProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);

    ///container with side padding, color, radiusand shadow
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProductDetailsScreen()),
      ),
      child: Container(
        width: 100,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [MShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(MSizes.productImageRadius),
          color: dark ? MColors.darkerGrey : MColors.white,
        ),
        child: Column(
          children: [
            /// Thumbnail, Wishlist Button, Discount tag
            MRoundedContainer(
              height: 100,
              padding: const EdgeInsets.all(MSizes.sm),
              backgroundColor: dark ? MColors.dark : MColors.grey,
              child: Stack(
                children: [
                  //Thumbnail image
                  const MRoundedImage(
                      width: 90,
                      height: 60,
                      imageUrl: MImages.productImage1,
                      applyImageRadius: true),
                  // sale tag
                  Positioned(
                    top: 12,
                    left: 8,
                    child: MRoundedContainer(
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
                  ),
                  // favorite icon button
                  const Positioned(
                    top: 12,
                    right: 8,
                    child: MCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: MSizes.spaceBtwItems / 2),
            // Details
            Padding(
              padding: const EdgeInsets.only(left: MSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MProductTitleText(
                    title: 'Green NIKE Air Shoes',
                    smallSize: true,
                  ),
                  const SizedBox(height: MSizes.spaceBtwItems / 2),
                  //brand text with small verification icon
                  Row(
                    children: [
                      Text("NIKE",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.labelMedium),
                      const SizedBox(width: MSizes.xs),
                      const Icon(
                        Iconsax.verify5,
                        color: MColors.primary,
                        size: MSizes.iconXs,
                      )
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // price
                      const MProductPriceText(price: "35.0"),
                      // Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: MColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(MSizes.cardRadiusMd),
                            bottomRight:
                                Radius.circular(MSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: MSizes.iconLg * 1.2,
                          height: MSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: MColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
