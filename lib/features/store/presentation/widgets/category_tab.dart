import 'package:e_commerce_m_flutter/features/store/presentation/widgets/brand_show_case.dart';
import 'package:flutter/material.dart';
import '../../../../common/layouts/grid_view_layout.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../shop/presentation/widgets/categories_widgets/section_heading.dart';

class MCategoryTab extends StatelessWidget {
  const MCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(children: [
            // Brands
            const MBrandShowCase(
              images: [
                MImages.productImage70,
                MImages.productImage71,
                MImages.productImage72,
              ],
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
            // Products
            MSectionHeading(
              title: "You might like",
              onPressed: () {},
            ),
            const SizedBox(height: MSizes.spaceBtwItems),
            const MGridViewLayout(itemCount: 4, mainAxisExtent: 250),
          ]),
        ),
      ],
    );
  }
}
