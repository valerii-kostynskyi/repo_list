import 'package:repo_list/domain/entity/repositry_entity.dart';

abstract class HomeRepository {
  Future<List<RepositoryEntity>> getHubbubList({
       required String query,
    required int offset,

  });
}
