import 'package:e_commerce_m_flutter/common/utils/constants/colors.dart';
import 'package:e_commerce_m_flutter/common/widgets/custom_shapes/m_circular_container.dart';
import 'package:flutter/material.dart';

class MChoiceChip extends StatelessWidget {
  const MChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? MColors.white : null),
      avatar: const MCircularConatiner(
        width: 50,
        height: 50,
        backgroundColor: Colors.amber,
      ),
      shape: const CircleBorder(),
      labelPadding: const EdgeInsets.all(0),
      padding:const EdgeInsets.all(0), 
      selectedColor: Colors.amber,
      backgroundColor: Colors.amber,
    );
  }
}
