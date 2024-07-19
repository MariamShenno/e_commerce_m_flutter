import 'package:flutter/material.dart';

import '../../../../common/widgets/m_responsive.dart';

class CustomTextBody extends StatelessWidget {
  final String text;
  const CustomTextBody({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double mediumFontSize = isLargeTablet ? 18.0 : 14.0;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: mediumFontSize,
            ),
      ),
    );
  }
}
