
import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/image_strings.dart';
import '../../../../../common/widgets/image_text_widgets/m_vertical_image_text.dart';

class MHomeCategories extends StatelessWidget {
  const MHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return MVerticalImageText(
              image: MImages.electronicsIcon,
               title: 'Mobile',
               onTap: (){},
               );
          }),
    );
  }
}
