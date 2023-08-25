import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/presentation/widget/svg_icon.dart';

class ItemRepositoryWidget extends StatelessWidget {
  final Function()? onTap;
  final RepositoryEntity repositoryItem;

  const ItemRepositoryWidget({
    Key? key,
    required this.onTap,
    required this.repositoryItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 16,
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(repositoryItem.name),
        subtitle: Text(
          repositoryItem.description,
          maxLines: 2,
          style: Theme.of(context).textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVGIcon(
              icon: 'icon_star',
              color: repositoryItem.isFavorite
                  ? Get.theme.colorScheme.primary
                  : Get.theme.colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
