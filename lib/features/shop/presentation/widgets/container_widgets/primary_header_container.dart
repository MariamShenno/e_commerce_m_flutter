import 'package:flutter/material.dart';

import '../../../../../common/utils/constants/colors.dart';
import 'curved_edges_widget.dart';
import 'custom_container.dart';

class MPrimaryHeaderContainer extends StatelessWidget {
  const MPrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MCurvedEdgesWidget(
      child: Container(
        color: MColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 350,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: MCircleContainer(
                  backgroundColor: MColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: MCircleContainer(
                  backgroundColor: MColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
