import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../features/shop/presentation/widgets/product_cards_widgets/product_price_text.dart';
import '../../features/shop/presentation/widgets/product_cards_widgets/rounded_container.dart';
import '../styles/shadows.dart';
import '../utils/constants/colors.dart';
import '../utils/constants/image_strings.dart';
import '../utils/constants/sizes.dart';
import '../utils/functions/functions.dart';
import '../widgets/brand/m_brand_title_with_verified_icon.dart';
import '../widgets/icons/m_circular_icon.dart';
import '../widgets/products/m_product_title_text.dart';
import '../widgets/images/m_rounded_image.dart';

class MGridViewLayout extends StatelessWidget {
  const MGridViewLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 200,
    // required this.itemBuilder,
  });

  final int itemCount;
  final double mainAxisExtent;
 // final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: MSizes.gridViewSpacing,
        crossAxisSpacing: MSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
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
                  height: 150,
                  padding: const EdgeInsets.all(MSizes.sm),
                  backgroundColor: dark ? MColors.dark : MColors.white,
                  child: Stack(
                    children: [
                      //Thumbnail image
                      const MRoundedImage(
                          width: 400,
                          height: 400,
                          imageUrl: MImages.productImage71,
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
                        top: 10,
                        right: 8,
                        child: MCircularIcon(
                          width: 40,
                          height: 40,
                          icon: Iconsax.heart5,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: MSizes.spaceBtwItems / 2),
                // Details
                const Padding(
                  padding: EdgeInsets.only(left: MSizes.sm),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MProductTitleText(
                        title: 'Iphone 12 blue',
                        smallSize: true,
                      ),
                      SizedBox(height: MSizes.spaceBtwItems / 2),
                      //brand text with small verification icon
                      MBrandTitleWithVerifiedIcon(title: 'Iphone'),
                    ],
                  ),
                ),
                const Spacer(),

                /// Price and Add to cart
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // price
                    const Padding(
                      padding: EdgeInsets.only(left: MSizes.sm),
                      child: MProductPriceText(price: "250.0"),
                    ),
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
        );
      },
    );
  }
}
