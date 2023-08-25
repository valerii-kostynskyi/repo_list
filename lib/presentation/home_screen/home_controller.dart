import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/favorite_repository.dart';
import 'package:repo_list/domain/home_repository.dart';
import 'package:repo_list/routes/app_pages.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = Get.find();
  final FavoriteRepository _favoriteRepository = Get.find();
  final RxList<RepositoryEntity> repositoryListRx = RxList.empty();
  final RxList<String> listSearch = RxList.empty();
  final RxBool isLoading = false.obs;
  final RxBool isAllLoaded = false.obs;
  final RxBool isFirstLoadingScreen = true.obs;

  //search input
  final TextEditingController searchController = TextEditingController();
  final RxBool isShowClearIcon = false.obs;
  final RxBool focused = false.obs;

  //timer
  Timer? searchOnStoppedTyping;
  Duration duration = const Duration(milliseconds: 800);

  StreamSubscription<int>? _favoritesSubscription;

  @override
  void onInit() {
    super.onInit();
    getRepositoryList();
    getSearchRequstsList();

    _favoritesSubscription =
        _favoriteRepository.favoriteChanges.listen((int repoId) {
      _updateFavoriteStatusForRepo(repoId);
    });
  }

  @override
  void onClose() {
    _favoritesSubscription?.cancel();
    super.onClose();
  }

  Future<void> getSearchRequstsList() async {
    listSearch.value = await _homeRepository.getSearchHistory();
  }

  void getRepositoryList({
    bool reset = false,
    String searchText = '',
  }) {
    isLoading.value = true;
    if (reset) {
      repositoryListRx.clear();
      isAllLoaded.value = false;
      isFirstLoadingScreen.value = true;
    }
    if (isAllLoaded.value) {
      isLoading.value = false;
      return;
    }

    _homeRepository.addToSearchHistory(searchRequest: searchText);

    _homeRepository
        .getHubbubList(
      offset: repositoryListRx.length,
      search: searchText,
    )
        .then((List<RepositoryEntity> hubbubList) {
      if (reset && repositoryListRx.isNotEmpty) {
        repositoryListRx.replaceRange(
          0,
          repositoryListRx.length,
          hubbubList,
        );
      }
      repositoryListRx.addAll(hubbubList);
      isLoading.value = false;
      isFirstLoadingScreen.value = false;
    });
  }

  void search(String searchText) {
    isShowClearIcon.value = true;
    isLoading.value = true;
    if (searchText.isEmpty) {
      isShowClearIcon.value = false;
      return;
    }

    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }

    searchOnStoppedTyping = Timer(duration, () {
      searchText = searchController.text;
      getRepositoryList(searchText: searchText, reset: true);
    });
  }

  void clearSearchController() {
    searchController.clear();
    repositoryListRx.clear();
  }

  void changeFocus() {
    focused.value = true;
  }

  void toggleFavorite(RepositoryEntity repository) async {
    RepositoryEntity updatedRepo = RepositoryEntity(
      id: repository.id,
      name: repository.name,
      description: repository.description,
      isFavorite: !repository.isFavorite,
      stargazersCount: repository.stargazersCount,
    );

    if (updatedRepo.isFavorite) {
      await _favoriteRepository.addFavoriteRepository(repository: updatedRepo);
    } else {
      await _favoriteRepository.removeFavoriteRepository(
          repository: updatedRepo);
    }

    int index =
        repositoryListRx.indexWhere((element) => element.id == repository.id);
    if (index != -1) {
      repositoryListRx[index] = updatedRepo;
    }
  }

  void _updateFavoriteStatusForRepo(int repoId) {
    int index = repositoryListRx.indexWhere((element) => element.id == repoId);
    if (index != -1) {
      RepositoryEntity repository = repositoryListRx[index];
      RepositoryEntity updatedRepo = RepositoryEntity(
        id: repository.id,
        name: repository.name,
        description: repository.description,
        isFavorite: !repository.isFavorite,
        stargazersCount: repository.stargazersCount,
      );
      repositoryListRx[index] = updatedRepo;
    }
  }

  void addValueToSearchBar(String value) {
    searchController.text = value;
    searchController.selection = TextSelection.fromPosition(
      TextPosition(offset: searchController.text.length),
    );
    getRepositoryList(searchText: value);
  }

  void openFavoritePage() {
    Get.toNamed(Routes.FAVORITE_PAGE);
  }
}
