import 'package:repo_list/util/json_extension.dart';

class RepositoryModel {
  final int id;
  final String name;
  final String description;
  final int stargazersCount;

  RepositoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.stargazersCount,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json.parseJsonAsInt(key: 'id'),
      name: json.parseJsonAsString(key: 'name'),
      description: json.parseJsonAsString(key: 'name'),
      stargazersCount: json.parseJsonAsInt(key: 'stargazers_count'),
    );
  }
}
