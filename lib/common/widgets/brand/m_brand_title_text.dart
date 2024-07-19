
import 'package:flutter/material.dart';
import '../../utils/constants/enums.dart';

class MBrandTitleText extends StatelessWidget {
  const MBrandTitleText({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.color,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSize.small,
  });

  final Color? color;
  final String title;
  final int maxlines;
  final TextAlign? textAlign;
  final TextSize brandTextSizes;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        overflow: TextOverflow.ellipsis,
        maxLines: maxlines,
        // check wich brandSize is required and set that style
        style: brandTextSizes == TextSize.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandTextSizes == TextSize.medium
                ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
                : brandTextSizes == TextSize.large
                    ? Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: color)
                    : Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: color));
  }
}
