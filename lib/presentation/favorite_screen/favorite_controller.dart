import 'package:get/get.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/favorite_repository.dart';

class FavoriteController extends GetxController {
  final FavoriteRepository _favoriteRepository = Get.find();
  final RxList<RepositoryEntity> repositoryListRx = RxList.empty();
  final RxBool isLoading = false.obs;
  final RxBool isAllLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFavoritesList();
  }

  getFavoritesList() async {
    isLoading.value = true;
    try {
      final favRepositories = await _favoriteRepository.getFavoritesList();
      repositoryListRx.addAll(favRepositories);
    } catch (e) {
      print("Error fetching favorite repositories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  toggleFavorite(RepositoryEntity repository) {}
}
