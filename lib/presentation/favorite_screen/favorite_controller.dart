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
      final List<RepositoryEntity> favRepositories =
          await _favoriteRepository.getFavoritesList();
      repositoryListRx.addAll(favRepositories);
    } catch (e) {
      print("Error fetching favorite repositories: $e");
    } finally {
      isLoading.value = false;
    }
  }

  removeFromFavorite(RepositoryEntity repository) async {
    try {
      repositoryListRx.remove(repository);
      await _favoriteRepository.removeFavoriteRepository(
          repository: repository);
    } catch (e) {
      print("Error removing from favorites: $e");
    }
  }
}
