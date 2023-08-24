import 'package:get/get.dart';

import 'package:repo_list/data/api_data_source.dart';

import '../../const.dart';

class ApiDataSourceImpl implements ApiDataSource {
  final GetConnect _getConnect = GetConnect();

  ApiDataSourceImpl() {
    _getConnect.baseUrl = apiUrl;
  }
}
