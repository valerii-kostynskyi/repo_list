import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:repo_list/data/db_adapter/profile_type_adapter.dart';
import 'package:repo_list/data/local_data_source.dart';
import 'package:repo_list/data/model/repository_model.dart';

class LocalDataSourceImpl implements LocalDataSource {
  static const String _repoBoxName = "repo";

  late Box<RepositoryModel> _repoBox;

  @override
  Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(RepoTypeAdapter());
    _repoBox = await Hive.openBox<RepositoryModel>(_repoBoxName);
  }

  @override
  Future saveRepo(RepositoryModel profile) {
    return _repoBox.put(0, profile);
  }

  @override
  Future clearLocalDB() {
    return _repoBox.clear();
  }

  @override
  ValueListenable repoListenable() {
    return _repoBox.listenable();
  }
}
