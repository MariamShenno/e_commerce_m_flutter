import 'package:e_commerce_m_flutter/common/utils/constants/image_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/sizes.dart';
import 'package:e_commerce_m_flutter/common/utils/constants/text_strings.dart';
import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/m_responsive.dart';
import '../../../../config/routes/routes.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  const RegistrationSuccessScreen({
    super.key,

  });
 

  @override
  Widget build(BuildContext context) {
    bool isLargeTablet = MResponsive.isLargeTablet(context);
    double mediumFontSize = isLargeTablet ? 18.0 : 14.0;
    double fontSize = isLargeTablet ? 20.0 : 16.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(MSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(MImages.staticSuccessIllustration),
                width: isLargeTablet
                    ? MFunctions.screenWidth(context) * 0.6
                    : double.infinity,
              ),
              SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwItems
                    : MSizes.spaceBtwItems,
              ),

              /// Title / SubTitle
              Text(
                MTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: fontSize,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwItems
                    : MSizes.spaceBtwItems,
              ),
              Text(
                MTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: mediumFontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: isLargeTablet
                    ? 2 * MSizes.spaceBtwItems
                    : MSizes.spaceBtwItems,
              ),
              Text(
                MTexts.confirmEmailSubTitle,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: mediumFontSize),
                textAlign: TextAlign.center,
              ),

              ///  Buttons
              SizedBox(
                width: isLargeTablet ? 300 : double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    Routes.login,
                  ),
                  child: Text(
                    MTexts.continues,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
