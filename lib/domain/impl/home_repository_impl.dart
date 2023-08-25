import 'package:repo_list/data/api_data_source.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/domain/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final ApiDataSource _apiDataSource;

  HomeRepositoryImpl(
    this._apiDataSource,
  );

  @override
  Future<List<RepositoryEntity>> getHubbubList({
    required String query,
    required int offset,
  }) {
    return _apiDataSource.getRepositoriesList(
      search: query,
      offset: offset,
    );
  }
}
