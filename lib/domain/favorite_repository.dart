import 'package:repo_list/domain/entity/repositry_entity.dart';

abstract class FavoriteRepository {
  Future<void> addFavoriteRepository({required RepositoryEntity repository});

  Future<void> removeFavoriteRepository({required RepositoryEntity repository});

  Future<List<RepositoryEntity>> getFavoritesList();
}
