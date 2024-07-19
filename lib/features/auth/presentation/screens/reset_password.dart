import 'package:flutter/material.dart';
import '../../../../common/utils/constants/image_strings.dart';
import '../../../../common/utils/constants/sizes.dart';
import '../../../../common/utils/functions/functions.dart';
import '../../../../common/widgets/m_responsive.dart';
import 'package:e_commerce_m_flutter/common/utils/extensions/translate_x_extension.dart';
import '../widgets/reset_password_widgets/reset_password_form.dart';

class ResetPassword extends StatelessWidget {
  final String email;
  const ResetPassword({
    super.key,
    required this.email,
  });
  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double mediumFontSize = isLargeTablet ? 18.0 : 14.0;
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    double iconSize = isLargeTablet ? 24.0 : 20.0;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(MImages.deliveredEmailIllustration),
                width: isLargeTablet
                    ? MFunctions.screenWidth(context) * 0.6
                    : double.infinity,
              ),
              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwItems
                      : MSizes.spaceBtwItems),

              /// Title / SubTitle
              Text(
                "changeYourPasswordTitle".tr(context),
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwItems
                      : MSizes.spaceBtwItems),
              Text(
                "changeYourPasswordSubTitle".tr(context),
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: mediumFontSize,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                  height: isLargeTablet
                      ? 2 * MSizes.spaceBtwItems
                      : MSizes.spaceBtwItems),

              /// Form
              ResetPasswordForm(
                email: email,
                iconSize: iconSize,
                fontSize: fontSize,
              ),
              SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwSections
                    : MSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
