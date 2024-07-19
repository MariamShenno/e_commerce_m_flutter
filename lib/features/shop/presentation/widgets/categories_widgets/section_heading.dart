import 'package:flutter/material.dart';

class MSectionHeading extends StatelessWidget {
  const MSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.onPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: textColor,
                fontSize:
                    Theme.of(context).textTheme.headlineSmall!.fontSize! * 0.8,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
