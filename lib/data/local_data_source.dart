import 'package:flutter/foundation.dart';
import 'package:repo_list/data/model/repository_model.dart';

abstract class LocalDataSource {
  Future init();

  Future saveRepo(RepositoryModel repo);

  Future clearLocalDB();

  ValueListenable repoListenable();
}
