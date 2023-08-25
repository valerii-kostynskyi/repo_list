import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:repo_list/data/db_adapter/repository_model_adapter.dart';
import 'package:repo_list/data/db_adapter/search_story_model_adapter.dart';
import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favorites = 'Favorites';
  static const _searchHistoryKey = 'searchHistoryKey';
  final StreamController<int> _favoritesStreamController =
      StreamController<int>.broadcast();

  Box<RepositoryEntity>? _favoritesBox;
  Box<List<String>>? _searchHistoryBox;

  @override
  Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepositoryModelAdapter());
    Hive.registerAdapter(SearchStoryAdapter());
    _favoritesBox = await Hive.openBox<RepositoryEntity>(_favorites);
    _favoritesBox!.watch().listen((event) {
      _favoritesStreamController.add(event.key as int);
    });
    _searchHistoryBox = await Hive.openBox<List<String>>(_searchHistoryKey);
  }

  void dispose() {
    _favoritesStreamController.close();
  }

  @override
  Future<List<RepositoryEntity>> getFavoritesList() async {
    return _favoritesBox?.values.toList() ?? [];
  }

  @override
  Future<void> addToFavorites(RepositoryEntity repository) async {
    if (_favoritesBox != null) {
      await _favoritesBox!.put(repository.id, repository);
    }
  }

  @override
  Future<void> removeFromFavorites(RepositoryEntity repository) async {
    if (_favoritesBox != null) {
      final keys = _favoritesBox!.keys;
      final keyToDelete = keys.firstWhere(
        (key) => _favoritesBox!.get(key)?.id == repository.id,
        orElse: () => null,
      );

      if (keyToDelete != null) {
        await _favoritesBox!.delete(keyToDelete);
      }
    }
  }

  @override
  Future<void> addToSearchHistory(String searchQuery) async {
    if (_searchHistoryBox != null) {
      if (searchQuery.trim().isEmpty) {
        return;
      }

      final historyList =
          _searchHistoryBox!.get(_searchHistoryKey, defaultValue: []);

      historyList!.remove(searchQuery);
      historyList.insert(0, searchQuery);

      if (historyList.length > 5) {
        historyList.removeLast();
      }

      await _searchHistoryBox!.put(_searchHistoryKey, historyList);
    }
  }

  @override
  Future<List<String>> getSearchHistory() async {
    try {
      return _searchHistoryBox?.get(
            _searchHistoryKey,
            defaultValue: [],
          ) ??
          [];
    } catch (e) {
      print('Error fetching search history from Hive: $e');
      return [];
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    if (_searchHistoryBox != null) {
      await _searchHistoryBox!.delete(_searchHistoryKey);
    }
  }

  @override
  Stream<int> get favoriteChanges => _favoritesStreamController.stream;
}
