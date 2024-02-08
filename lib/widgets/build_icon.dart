import 'package:flutter/material.dart';

import '../tab_item.dart';
import '../count_style.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIconData = item.icon is IconData;
    Widget icon;

    if (isIconData) {
      icon = Icon(
        item.icon,
        size: iconSize,
        color: iconColor,
      );
    } else {
      icon = SizedBox(
        child: item.icon,
        width: iconSize,
        height: iconSize,
      );
    }

    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          isIconData
              ? Icon(
                  item.icon,
                  size: iconSize,
                  color: iconColor,
                )
              : icon,
          PositionedDirectional(
            start: iconSize - sizeBadge / 2,
            top: -sizeBadge / 2,
            child: item.count!,
          ),
        ],
      );
    }

    return icon;
  }
}
