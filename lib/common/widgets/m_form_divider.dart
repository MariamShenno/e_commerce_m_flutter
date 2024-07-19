// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_m_flutter/common/utils/constants/colors.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';

class MFormDivider extends StatelessWidget {
  const MFormDivider({
    super.key,
    required this.dividerText,
  });

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: dark ? MColors.darkGrey : MColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: dark ? MColors.darkGrey : MColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
      ],
    );
  }
}
