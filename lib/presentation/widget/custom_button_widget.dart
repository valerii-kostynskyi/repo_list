import 'package:flutter/material.dart';
import 'package:repo_list/presentation/widget/svg_icon.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onTap;
  final String icon;

  const CustomButtonWidget({
    super.key,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            padding: const EdgeInsets.all(10),
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: SVGIcon(
              icon: icon,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
