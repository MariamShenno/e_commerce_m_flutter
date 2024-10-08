import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import '../../../../../common/utils/constants/text_strings.dart';
import '../../../../../common/widgets/appbar/m_app_bar.dart';
import 'cart_menu_icon.dart';

class MHomeAppBar extends StatelessWidget {
  const MHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            MTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: MColors.white),
          ),
          Text(
            MTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: MColors.white),
          ),
        ],
      ),
      actions: [
        MCartCounterIcon(
          onPressed: () {},
        ),
      ],
    );
  }
}
