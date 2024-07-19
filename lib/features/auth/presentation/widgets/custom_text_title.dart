import 'package:flutter/material.dart';

import '../../../../common/widgets/m_responsive.dart';

class CustomTextTitle extends StatelessWidget {
  final String text;
  const CustomTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: fontSize,
          ),
    );
  }
}
