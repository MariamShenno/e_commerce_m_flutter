import 'package:e_commerce_m_flutter/common/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class MCircularConatiner extends StatelessWidget {
  const MCircularConatiner({
    super.key,
    this.width = 400,
    this.height = 400,
    this.raduis = 400,
    this.padding = 0,
    this.margin,
    this.child,
    this.backgroundColor = MColors.white,
  });
  final double? width;
  final double? height;
  final double raduis;
  final double padding;
  final EdgeInsets? margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: backgroundColor,
      ),
    );
  }
}
