import 'package:repo_list/data/api_data_source.dart';
import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiDataSource _apiDataSource;
  final LocalDataSource _localDataSource;

  HomeRepositoryImpl(
    this._apiDataSource,
    this._localDataSource,
  );

  @override
  Future<List<RepositoryEntity>> getHubbubList({
    required String search,
    required int offset,
  }) async {
    List<RepositoryEntity> favoriteList =
        await _localDataSource.getFavoritesList();
    List<RepositoryEntity> networkList =
        await _apiDataSource.getRepositoriesList(
      search: search,
      offset: offset,
    );

    for (RepositoryEntity netRepo in networkList) {
      for (RepositoryEntity favRepo in favoriteList) {
        if (netRepo.id == favRepo.id) {
          netRepo.isFavorite = true;
          break;
        }
      }
    }

    return networkList;
  }

  @override
  Future<List<String>> getSearchHistory() async {
    return _localDataSource.getSearchHistory();
  }

  @override
  Future<void> addToSearchHistory({required String searchRequest}) async {
    await _localDataSource.addToSearchHistory(searchRequest);
  }

  @override
  Future<void> clearSearchHistory() async {
    await _localDataSource.clearSearchHistory();
  }
}
