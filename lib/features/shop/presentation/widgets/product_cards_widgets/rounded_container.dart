import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';

class MRoundedContainer extends StatelessWidget {
  const MRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.raduis = MSizes.cardRadiusMd,
    this.child,
    this.shadowBorder = false,
    this.backgroundColor = MColors.white,
    this.borderColor = MColors.borderPrimary,
  });

  final double? width;
  final double? height;
  final double raduis;
  final Widget? child;
  final bool shadowBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(raduis),
        border: shadowBorder ? Border.all(color: borderColor) : null,
      ),
      child:  child,
    );
  }
}
