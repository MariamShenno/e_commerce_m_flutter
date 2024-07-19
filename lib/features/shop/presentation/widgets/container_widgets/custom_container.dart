import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';

class MCircleContainer extends StatelessWidget {
  const MCircleContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.redius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = MColors.white,
  });

  final double? width;
  final double height;
  final double redius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(redius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
