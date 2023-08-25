import 'package:repo_list/domain/entity/repositry_entity.dart';

abstract class LocalDataSource {
  Future init();

  Future<List<RepositoryEntity>> getFavoritesList();

  Future addToFavorites(RepositoryEntity repository);

  Future removeFromFavorites(RepositoryEntity repository);

  Future<List<String>> getSearchHistory();

  Future<void> addToSearchHistory(String searchQuery);

  Future<void> clearSearchHistory();

  Stream<int> get favoriteChanges;
}
