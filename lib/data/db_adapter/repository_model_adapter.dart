import 'package:hive/hive.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';

class RepositoryModelAdapter extends TypeAdapter<RepositoryEntity> {
  @override
  final int typeId = 1;

  @override
  RepositoryEntity read(BinaryReader reader) {
    final id = reader.readInt();
    final name = reader.readString();
    final description = reader.readString();
    final stargazersCount = reader.readInt();
    final isFavorite = reader.readBool();

    return RepositoryEntity(
      id: id,
      name: name,
      description: description,
      stargazersCount: stargazersCount,
      isFavorite: isFavorite,
    );
  }

  @override
  void write(BinaryWriter writer, RepositoryEntity obj) {
    writer.writeInt(obj.id);
    writer.writeString(obj.name);
    writer.writeString(obj.description);
    writer.writeInt(obj.stargazersCount);
    writer.writeBool(obj.isFavorite);
  }
}
