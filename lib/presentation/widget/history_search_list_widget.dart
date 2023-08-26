import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/presentation/widget/custom_list.dart';
import 'package:repo_list/presentation/widget/empty_screen.dart';

class HistorySearchListWidget extends StatelessWidget {
  // Functions
  final void Function(String) onTap;
  final Function() onClearButtonTap;

  // Rx
  final RxList<String> list;

  const HistorySearchListWidget({
    super.key,
    required this.onTap,
    required this.onClearButtonTap,
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
          const SizedBox(height: 16),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'txt_search_history_title'.tr,
                  style: Get.textTheme.headlineMedium,
                ),
                if (list.isNotEmpty)
                  InkWell(
                    onTap: onClearButtonTap,
                    child: Text(
                      'txt_clear_history_title'.tr,
                      style: Get.textTheme.headlineMedium!.copyWith(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => CustomList(
                emptyListMessage:
                    EmptyScreen(text: 'txt_empty_history_message'.tr),
                count: list.length,
                onBuildItem: (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(
                      list[index],
                      textAlign: TextAlign.left,
                    ),
                    onTap: () => onTap.call(list[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
