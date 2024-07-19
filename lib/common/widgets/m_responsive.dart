import 'package:flutter/material.dart';

class MResponsive extends StatelessWidget {
  final Widget smallmobile;
  final Widget mobile;
  final Widget tablet;
  final Widget? largeTablet;
  final Widget? desktop;
  const MResponsive({
    super.key,
    required this.smallmobile,
    required this.mobile,
    required this.tablet,
    this.largeTablet,
    this.desktop,
  });

  /// Small Phone < 400
  static bool isSmallMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 400;

  /// Phone >= 400 && < 650
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width >= 400 &&
      MediaQuery.of(context).size.width < 650;

  /// Tablet >= 650 && < 900
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 650 &&
      MediaQuery.of(context).size.width < 900;

  /// Large Tablet >= 900 && < 1100
  static bool isLargeTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 900 &&
      MediaQuery.of(context).size.width < 1100;

  /// Desktop >= 1100
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1100) {
          return desktop ?? largeTablet ?? tablet;
        } else if (constraints.maxWidth >= 900) {
          return largeTablet ?? tablet;
        } else if (constraints.maxWidth >= 650) {
          return tablet;
        } else if (constraints.maxWidth >= 400) {
          return mobile;
        } else {
          return smallmobile;
        }
      },
    );
  }
}
