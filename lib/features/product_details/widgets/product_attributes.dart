import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/features/shop/presentation/widgets/categories_widgets/section_heading.dart';
import 'package:flutter/material.dart';

class MProductAttributes extends StatelessWidget {
  const MProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MSectionHeading(title: "Sizes"),
        const SizedBox(height: MSizes.spaceBtwItems / 2),
        Wrap(
          spacing: 8,
          children: [
            ChoiceChip(
                label: const Text("EU 34"),
                selected: true,
                onSelected: (value) {}),
            ChoiceChip(
                label: const Text("EU 36"),
                selected: false,
                onSelected: (value) {}),
            ChoiceChip(
                label: const Text("EU 38"),
                selected: true,
                onSelected: (value) {}),
            ChoiceChip(
                label: const Text("EU 34"),
                selected: true,
                onSelected: (value) {}),
            ChoiceChip(
                label: const Text("EU 36"),
                selected: false,
                onSelected: (value) {}),
            ChoiceChip(
                label: const Text("EU 38"),
                selected: true,
                onSelected: (value) {}),
          ],
        ),
      ],
    );
  }
}
