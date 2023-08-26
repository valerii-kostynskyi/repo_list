import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyScreen extends StatelessWidget {
  final String text;

  const EmptyScreen({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Get.textTheme.bodySmall,
        ),
      ),
    );
  }
}
