import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import 'package:flutter/material.dart';
import '../../../../../common/utils/constants/image_strings.dart';
import '../../../../../common/utils/constants/sizes.dart';
import '../../../../../common/widgets/m_responsive.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double mediumFontSize = isLargeTablet ? 18.0 : 14.0;
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    return Column(
      children: [
        Image(
          height: isLargeTablet ? 200 : 150,
          image: AssetImage(dark ? MImages.darkAppLogo : MImages.darkAppLogo),
        ),
        Text(
          "loginTitle".tr(context),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: fontSize,
              ),
        ),
        const SizedBox(
          height: MSizes.sm,
        ),
        Text(
          "loginSubTitle".tr(context),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: mediumFontSize,
              ),
        ),
      ],
    );
  }
}
