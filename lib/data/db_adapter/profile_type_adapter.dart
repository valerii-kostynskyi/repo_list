import 'package:hive/hive.dart';
import 'package:repo_list/data/db_adapter/adapter_type_id.dart';
import 'package:repo_list/data/model/repository_model.dart';

class RepoTypeAdapter extends TypeAdapter<RepositoryModel> {
  @override
  int get typeId => AdapterTypeId.repoTypeid;

  @override
  RepositoryModel read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final description = reader.readString();
    final stargazersCount = reader.readInt();

    return RepositoryModel(
      id: id,
      name: name,
      description: description,
      stargazersCount: stargazersCount,
    );
  }

  @override
  void write(
    BinaryWriter writer,
    RepositoryModel obj,
  ) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeInt(obj.stargazersCount);
  }
}
