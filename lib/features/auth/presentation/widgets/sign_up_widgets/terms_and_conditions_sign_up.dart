import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/widgets/m_responsive.dart';

class TermsAndConditions extends StatelessWidget {
  final double fontSize;
  final bool dark;

  const TermsAndConditions({
    super.key,
    required this.fontSize,
    required this.dark,
  });

  @override
  Widget build(BuildContext context) {
    final bool isLargeTablet = MResponsive.isLargeTablet(context);

    return Row(
      children: [
        SizedBox(
          width: isLargeTablet ? 48 : 24,
          height: isLargeTablet ? 48 : 24,
          child: Checkbox(
            value: true,
            onChanged: (value) {},
          ),
        ),
        SizedBox(
          width:
              isLargeTablet ? 2 * MSizes.spaceBtwItems : MSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "iAgreeTo".tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: fontSize),
                ),
                TextSpan(
                  text: "privacyPolicy".tr(context),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? MColors.white : MColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? MColors.white : MColors.primary,
                        fontSizeFactor: isLargeTablet ? 1.25 : 1.0,
                      ),
                ),
                TextSpan(
                  text: 'and'.tr(context),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: fontSize),
                ),
                TextSpan(
                  text: "termsOfUse".tr(context),
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? MColors.white : MColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: dark ? MColors.white : MColors.primary,
                        fontSizeFactor: isLargeTablet ? 1.25 : 1.0,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
