import 'package:get/get.dart';
import 'package:repo_list/data/api_data_source.dart';
import 'package:repo_list/data/impl/api_data_source_impl.dart';
import 'package:repo_list/data/impl/local_data_source_impl.dart';
import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/domain/impl/home_repository_impl.dart';

import 'domain/home_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Data Source
    Get.put<ApiDataSource>(ApiDataSourceImpl(), permanent: true);
    Get.put<LocalDataSource>(LocalDataSourceImpl()..init());

    // Repository
    Get.put<HomeRepository>(
      HomeRepositoryImpl(),
      permanent: true,
    );
  }
}
