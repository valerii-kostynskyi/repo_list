import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/home_repository.dart';

class HomeController extends GetxController {
  final HomeRepository _homeRepository = Get.find();
  final RxList<RepositoryEntity> repositoryListRx = RxList.empty();
  final RxBool isLoading = false.obs;
  final RxBool isAllLoaded = false.obs;
  final RxBool isFirstLoadingScreen = true.obs;
  final TextEditingController searchController = TextEditingController();

  //timer
  Timer? searchOnStoppedTyping;
  Duration duration = const Duration(milliseconds: 800);

  @override
  void onInit() {
    super.onInit();
    getRepositoryList();
  }

  void getRepositoryList({
    bool reset = false,
    String searchText = '',
  }) {
    // if (isLoading.value) {
    //   return;
    // }
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

    _homeRepository
        .getHubbubList(
      offset: repositoryListRx.length,
      query: searchText,
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
    if (searchText.isEmpty) {
      // emptySearchField();
      return;
    }

    if (searchOnStoppedTyping != null) {
      searchOnStoppedTyping!.cancel();
    }

    searchOnStoppedTyping = Timer(duration, () {
      getRepositoryList(searchText: searchText, reset: true);
    });
  }

  void clearSearchController() {
    searchController.clear();
    repositoryListRx.clear();
  }
}
