import 'package:cat_match/data/assets_data.dart';
import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final void Function(int) handleClick;
  final int index;
  final bool isSelected;

  const TileWidget({
    super.key,
    required this.handleClick,
    required this.index,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    String hiddenPath = isSelected ? hiddenContent[index] : '';

    return InkWell(
      onTap: () => handleClick(index),
      highlightColor: Theme.of(context).colorScheme.secondary,
      splashColor: Theme.of(context).colorScheme.tertiaryFixed,
      child: Ink(
        color: isSelected
            ? Theme.of(context).colorScheme.secondary
            : Theme.of(context).colorScheme.tertiary,
        child: Center(
            child: hiddenPath.isNotEmpty
                ? Image.asset(hiddenPath)
                : const Text("")),
      ),
    );
  }
}
