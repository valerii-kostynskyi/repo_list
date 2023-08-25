import 'package:repo_list/data/model/repository_model.dart';

abstract class ApiDataSource {
  Future<List<RepositoryModel>> getRepositoriesList({
    required String search,
    required int offset,
  });
}
