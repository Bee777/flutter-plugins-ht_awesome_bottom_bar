import 'package:flutter/material.dart';

import 'widgets/icon_wrapper.dart';

typedef WidgetIconBuilder = Widget Function(
    BuildContext context, Color? color, double iconSize);

class TabItem {
  final IconWrapper icon;

  final String? title;
  final Widget? count;
  final String? key;

  const TabItem({
    required this.icon,
    this.title,
    this.count,
    this.key,
  });
}
