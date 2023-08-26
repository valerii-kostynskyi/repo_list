import 'dart:convert';

import 'package:get/get.dart';
import 'package:repo_list/const.dart';
import 'package:repo_list/data/api_data_source.dart';
import 'package:repo_list/data/model/repository_model.dart';
import 'package:repo_list/util/http_extension.dart';

class ApiDataSourceImpl implements ApiDataSource {
  final GetConnect _getConnect = GetConnect();

  ApiDataSourceImpl() {
    _getConnect.baseUrl = apiUrl;
  }

  @override
  Future<List<RepositoryModel>> getRepositoriesList({
    required String search,
    required int offset,
  }) async {
    if (search.isEmpty) {
      return [];
    }

    final Map<String, String> query = {
      'per_page': apiRequsetPerPage,
      'page': offset.toString(),
      'q': search,
    };

    final Response<dynamic> response = await _getConnect.getRequest(
      url: '/search/repositories',
      query: query,
    );

    if (response.status.isOk) {
      final jsonData = json.decode(response.bodyString!);

      if (jsonData['items'] is List<dynamic>) {
        final items = jsonData['items'] as List<dynamic>;
        return items
            .map<RepositoryModel>((item) => RepositoryModel.fromJson(item))
            .toList();
      }
    } else {
      throw Exception("Error fetching repositories: ${response.bodyString}");
    }

    return [];
  }
}
