import 'package:hive_flutter/hive_flutter.dart';
import 'package:repo_list/data/db_adapter/repository_model_adapter.dart';
import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _favorites = 'Favorites';
  static const String _searchHistory = 'SearchHistory';

  Box<RepositoryEntity>? _favoritesBox;
  Box<String>? _searchHistoryBox;

  @override
  Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepositoryModelAdapter());
    _favoritesBox = await Hive.openBox<RepositoryEntity>(_favorites);
    _searchHistoryBox = await Hive.openBox<String>(_searchHistory);
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
  Future<List<String>> getSearchHistory() async {
    return _searchHistoryBox?.values.toList() ?? [];
  }

  @override
  Future<void> addToSearchHistory(String searchQuery) async {
    if (_searchHistoryBox != null) {
      final historyList = _searchHistoryBox!.values.toList();
      historyList.remove(searchQuery);
      historyList.insert(0, searchQuery);

      if (historyList.length > 5) {
        historyList.removeLast();
      }

      await _searchHistoryBox!.clear();
      await _searchHistoryBox!.addAll(historyList);
    }
  }

  @override
  Future<void> clearSearchHistory() async {
    if (_searchHistoryBox != null) {
      await _searchHistoryBox!.clear();
    }
  }
}
