import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorySearchListWidget extends StatelessWidget {
  final void Function(String)? onTap;
  final List<String> list;

  const HistorySearchListWidget({
    super.key,
    required this.onTap,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Search History',
            style: Get.textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(
                      list[index],
                      textAlign: TextAlign.left,
                    ),
                    onTap: () => onTap?.call(list[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
