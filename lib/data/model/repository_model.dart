import 'package:repo_list/domain/entity/repositry_entity.dart';
import 'package:repo_list/util/json_extension.dart';

class RepositoryModel extends RepositoryEntity {
  RepositoryModel({
    required int id,
    required String name,
    required String description,
    required int stargazersCount,
  }) : super(
          id: id,
          name: name,
          description: description,
          stargazersCount: stargazersCount,
        );

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json.parseJsonAsInt(key: 'id'),
      name: json.parseJsonAsString(key: 'name'),
      description: json.parseJsonAsString(key: 'name'),
      stargazersCount: json.parseJsonAsInt(key: 'stargazers_count'),
    );
  }
}
