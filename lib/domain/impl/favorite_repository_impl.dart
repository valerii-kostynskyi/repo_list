import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/favorite_repository.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final LocalDataSource _localDataSource;

  FavoriteRepositoryImpl(
    this._localDataSource,
  );

  @override
  Future<void> addFavoriteRepository({
    required RepositoryEntity repository,
  }) {
    return _localDataSource.addToFavorites(repository);
  }

  @override
  Future<void> removeFavoriteRepository({
    required RepositoryEntity repository,
  }) {
    return _localDataSource.removeFromFavorites(repository);
  }

  @override
  Future<List<RepositoryEntity>> getFavoritesList() {
    return _localDataSource.getFavoritesList();
  }

  @override
  Stream<int> get favoriteChanges => _localDataSource.favoriteChanges;
}
