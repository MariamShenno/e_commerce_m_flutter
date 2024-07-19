import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/layouts/grid_view_layout.dart';
import '../widgets/banner_widgets/promo_slider.dart';
import '../widgets/home_appbar_widgets/home_appbar.dart';
import '../widgets/home_appbar_widgets/search_container.dart';
import '../widgets/container_widgets/primary_header_container.dart';
import '../widgets/categories_widgets/section_heading.dart';
import '../widgets/home_categories_wisget/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            const MPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  MHomeAppBar(),
                  SizedBox(height: MSizes.defaultSpace),

                  /// SearchBar
                  MSearchContainer(
                      icon: Iconsax.search_normal, text: 'Search in Store'),
                  SizedBox(height: MSizes.spaceBtwSections),

                  /// Heading
                  Padding(
                    padding: EdgeInsets.only(left: MSizes.defaultSpace),
                    child: Column(
                      children: [
                        MSectionHeading(
                          title: 'Popular Categories',
                          textColor: Colors.white,
                          showActionButton: false,
                        ),
                        SizedBox(height: MSizes.spaceBtwItems),

                        /// Categories
                        MHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(MSizes.defaultSpace),
              child: Column(
                children: [
                  /// product slider
                  const MPromoSlider(
                    banners: [
                      MImages.banner3,
                      MImages.banner7,
                      MImages.banner8,
                    ],
                  ),
                  const SizedBox(height: MSizes.spaceBtwSections),
                  MSectionHeading(
                    title: 'Popular Products',
                    textColor: Colors.black,
                    showActionButton: false,
                    onPressed: (){},
                  ),
                const  SizedBox(height: MSizes.spaceBtwItems),

                  /// popular products
                  const MGridViewLayout(itemCount: 4, mainAxisExtent: 250),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
