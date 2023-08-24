import 'package:flutter/material.dart';
import 'package:repo_list/presentation/widget/svg_icon.dart';

class InputTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onTapSuffix;
  final Function()? onTapPrefix;
  final ValueChanged<String>? onChanged;
  final String hintText;

  const InputTextFieldWidget({
    super.key,
    required this.controller,
    this.onTapPrefix,
    this.onTapSuffix,
    this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        suffix: GestureDetector(
          onTap: onTapSuffix,
          child: Transform.translate(
            offset: const Offset(0.0, 3.0),
            child: const SVGIcon(
              icon: 'icon_close',
            ),
          ),
        ),
        prefixIcon: GestureDetector(
          onTap: onTapPrefix,
          child: const Padding(
            padding: EdgeInsets.only(
              left: 18.0,
              right: 10,
            ),
            child: SVGIcon(
              icon: 'icon_search',
            ),
          ),
        ),
      ),
    );
  }
}
