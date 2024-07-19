import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';

class MCircularIcon extends StatelessWidget {
  const MCircularIcon({
    super.key,
    this.width,
    this.height,
    this.size = MSizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    //final isDarkMode = MFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor != null
            ? backgroundColor!
            : MFunctions.isDarkMode(context)
                ? MColors.black.withOpacity(0.9)
                : MColors.white.withOpacity(0.9),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
          // color: color ?? (isDarkMode ? MColors.white : MColors.black),
          // color: backgroundColor ?? (
          //   isDarkMode
          //         ? MColors.black.withOpacity(0.9)
          //         : MColors.white.withOpacity(0.9)
          //         ),
          //color,
        ),
      ),
    );
  }
}
