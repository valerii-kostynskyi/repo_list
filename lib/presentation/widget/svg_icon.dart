import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGIcon extends StatelessWidget {
  final String icon;
  final Color? color;
  final Function()? onTap;

  const SVGIcon({
    required this.icon,
    this.color,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/icons/$icon.svg',
        color: color,
      ),
    );
  }
}
