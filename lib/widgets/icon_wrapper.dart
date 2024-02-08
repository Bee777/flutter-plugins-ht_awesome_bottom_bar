import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class IconWrapper {}

class IconDataWrapper implements IconWrapper {
  final IconData iconData;

  const IconDataWrapper(this.iconData);
}

class SvgIconWrapper implements IconWrapper {
  final String assetPath;
  final String activeAssetPath;

  final bool useColorActive;

  final BlendMode blendMode;

  const SvgIconWrapper(
      {required this.assetPath,
      required this.activeAssetPath,
      this.useColorActive = false,
      this.blendMode = BlendMode.srcIn});
}
