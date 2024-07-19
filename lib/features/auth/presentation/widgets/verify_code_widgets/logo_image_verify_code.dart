import 'package:flutter/material.dart';
import '../../../../../common/utils/constants/image_strings.dart';


class LogoImage extends StatelessWidget {
  final bool isLargeTablet;

  const LogoImage({super.key, required this.isLargeTablet});

  @override
  Widget build(BuildContext context) {
    return Image(
      height: isLargeTablet ? 200 : 150,
      image: const AssetImage(MImages.darkAppLogo),
    );
  }
}
