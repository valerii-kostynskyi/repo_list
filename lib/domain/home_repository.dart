import 'package:repo_list/domain/entity/repositry_entity.dart';

abstract class HomeRepository {
  Future<List<RepositoryEntity>> getHubbubList({
    required String search,
    required int offset,
  });

  Future<void> addToSearchHistory({required String query});

  Future<List<String>> getSearchHistory();

  Future<void> clearSearchHistory();
}
