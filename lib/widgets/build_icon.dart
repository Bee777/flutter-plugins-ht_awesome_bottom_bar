import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ht_awesome_bottom_bar/widgets/icon_wrapper.dart';

import '../tab_item.dart';
import '../count_style.dart';

class BuildIcon extends StatelessWidget {
  final TabItem item;
  final double iconSize;
  final Color iconColor;
  final CountStyle? countStyle;

  final bool isSelected;

  const BuildIcon({
    Key? key,
    required this.item,
    required this.iconColor,
    required this.isSelected,
    this.iconSize = 22,
    this.countStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isIconData = item.icon is IconDataWrapper;
    bool isIconBuilder = item.icon is SvgIconWrapper;

    assert(isIconData || isIconBuilder,
        'A TabItem can have either an IconDataWrapper or a WidgetIconWrapper');

    Widget icon;

    if (isIconData) {
      icon = Icon(
        (item.icon as IconDataWrapper).iconData,
        size: iconSize,
        color: iconColor,
      );
    } else {
      final svgIconWrapper = (item.icon as SvgIconWrapper);
      icon = Stack(
        clipBehavior: Clip.none,
        children: [
          SvgPicture.asset(svgIconWrapper.assetPath,
              width: iconSize,
              height: iconSize,
              allowDrawingOutsideViewBox: true,
              colorFilter: svgIconWrapper.useColorActive
                  ? ColorFilter.mode(iconColor, svgIconWrapper.blendMode)
                  : null),
          Opacity(
            opacity: isSelected ? 1 : 0,
            child: SvgPicture.asset(svgIconWrapper.activeAssetPath,
                width: iconSize,
                height: iconSize,
                allowDrawingOutsideViewBox: true,
                colorFilter: svgIconWrapper.useColorActive
                    ? ColorFilter.mode(iconColor, svgIconWrapper.blendMode)
                    : null),
          )
        ],
      );
    }

    if (item.count is Widget) {
      double sizeBadge = countStyle?.size ?? 18;

      return Stack(
        clipBehavior: Clip.none,
        children: [
          isIconData
              ? Icon(
                  (item.icon as IconDataWrapper).iconData,
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
