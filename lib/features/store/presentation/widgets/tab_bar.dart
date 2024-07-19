import 'package:e_commerce_m_flutter/common/utils/functions/functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/constants/colors.dart';
import '../../../../common/utils/constants/sizes.dart';

class MTabBar extends StatelessWidget implements PreferredSizeWidget{
  const MTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = MFunctions.isDarkMode(context);
    return Material(
      color: dark ? MColors.black : MColors.white,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: MColors.warning,
        labelColor:  dark ? MColors.white : MColors.warning,
        unselectedLabelColor: MColors.darkerGrey,
        ),
    );
  }
  
  @override
////Check
   Size get preferredSize => const Size.fromHeight(MSizes.appBarWeight);
}