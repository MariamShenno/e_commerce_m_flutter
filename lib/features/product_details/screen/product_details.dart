import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/categories_widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../widgets/bottom_add_to_cart.dart';
import '../widgets/product-meta_data.dart';
import '../widgets/product_attributes.dart';
import '../widgets/product_image_slider.dart';
import '../widgets/rating_share.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Product Image Slider
            const MProductImageSlider(),
            // Product Details
            Padding(
              padding: const EdgeInsets.only(
                  right: MSizes.defaultSpace,
                  left: MSizes.defaultSpace,
                  bottom: MSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share Button
                  const MRatingAndShare(),

                  /// Price, Title, Stock, Brand
                  const MProductMetaData(),

                  /// Attributes
                 const MProductAttributes(),
                  const SizedBox(height: MSizes.spaceBtwSections),

                  /// Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Checkout")),
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),

                  /// Description
                  const MSectionHeading(
                      title: "Description", showActionButton: false),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  const ReadMoreText(
                    "This is a Product Description for Blue Mobile Sleave less vest. There are more things that can be added.....,Hello Every One",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show More',
                    trimExpandedText: "Less",
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// Reviews
                  const Divider(),
                  const SizedBox(height: MSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MSectionHeading(
                          title: "Reviews(200)", showActionButton: false),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Iconsax.arrow_right3, size: 18)),
                    ],
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
