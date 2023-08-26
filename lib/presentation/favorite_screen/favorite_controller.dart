import 'package:get/get.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/favorite_repository.dart';

class FavoriteController extends GetxController {
  // Dependencies
  final FavoriteRepository _favoriteRepository = Get.find();

  // Rx
  final RxList<RepositoryEntity> repositoryListRx = RxList.empty();
  final RxBool isLoading = false.obs;
  final RxBool isAllLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFavoritesList();
  }

  Future<void> getFavoritesList() async {
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

  Future<void> removeFromFavorite(RepositoryEntity repository) async {
    try {
      repositoryListRx.remove(repository);
      await _favoriteRepository.removeFavoriteRepository(
          repository: repository);
    } catch (e) {
      print("Error removing from favorites: $e");
    }
  }
}
