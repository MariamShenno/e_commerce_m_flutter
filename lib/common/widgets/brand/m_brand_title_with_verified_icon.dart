import 'package:e_commerce_m_flutter/common/widgets/brand/m_brand_title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/enums.dart';
import '../../utils/constants/sizes.dart';

class MBrandTitleWithVerifiedIcon extends StatelessWidget {
  const MBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textColor,
    this.iconColor = MColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSize.small,
  });

  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSize brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: MBrandTitleText(
              title: title,
              color: textColor,
              maxlines: maxlines,
              textAlign: textAlign,
              brandTextSizes: brandTextSizes),
        ),
        const SizedBox(width: MSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: MSizes.iconXs,
        )
      ],
    );
  }
}
