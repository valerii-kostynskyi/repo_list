import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:repo_list/presentation/widget/svg_icon.dart';
import 'package:repo_list/style/app_colors.dart';

class InputTextFieldWidget extends StatelessWidget {
  final String? errorText;
  final String? labelText;
  final String? prefixIconAsset;
  final bool isShowSuffixIconAsset;
  final Color? colorIcon;
  final bool floatingLabelBehavior;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextEditingController? controller;
  final bool disabled;
  final TextInputType? textInputType;
  final bool readOnly;
  final bool autofocus;
  final TextInputAction? textInputAction;
  final Color? labelStyleColor;
  final FocusNode focusNode = FocusNode();
  final ValueChanged<String>? onChanged;
  final Color? backgroundColor;
  final TextStyle? hintStyle;
  final bool focused;
  final Function()? onTap;
  final Function()? onSuffixTap;

  InputTextFieldWidget({
    Key? key,
    this.inputFormatters,
    this.textInputAction,
    this.textInputType,
    this.errorText,
    this.disabled = false,
    this.autofocus = false,
    this.labelText,
    this.prefixIconAsset,
    this.isShowSuffixIconAsset = false,
    this.colorIcon,
    this.floatingLabelBehavior = true,
    this.maxLines = 1,
    this.controller,
    this.hintText,
    this.readOnly = false,
    this.labelStyleColor,
    this.onChanged,
    this.backgroundColor,
    this.hintStyle,
    this.focused = false,
    this.onTap,
    this.onSuffixTap,
  }) : super(key: key) {
    if (focused) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 3),
          child: TextField(
            autofocus: autofocus,
            focusNode: focusNode,
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            enabled: !disabled,
            readOnly: readOnly,
            onTap: onTap,
            onChanged: onChanged,
            controller: controller,
            textInputAction: textInputAction,
            maxLines: maxLines,
            decoration: InputDecoration(
              fillColor: focused
                  ? AppColors.primary.withOpacity(0.15)
                  : AppColors.divider,
              hintText: hintText,
              prefixIconConstraints: const BoxConstraints(maxWidth: 44),
              suffixIconConstraints: const BoxConstraints(maxWidth: 44),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 10.0,
                ),
                child: SVGIcon(
                  icon: 'icon_search',
                  color: Get.theme.colorScheme.primary,
                ),
              ),
              suffixIcon: focused
                  ? Padding(
                      padding: const EdgeInsets.only(
                        right: 15.0,
                        left: 10.0,
                      ),
                      child: SVGIcon(
                        onTap: onSuffixTap,
                        icon: 'icon_close',
                        color: Get.theme.colorScheme.primary,
                      ),
                    )
                  : null,
              errorText: errorText,
              label: labelText == null
                  ? null
                  : Text(
                      labelText!,
                      style: TextStyle(
                        color: labelStyleColor,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
