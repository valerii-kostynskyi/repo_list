import 'package:hive/hive.dart';
import 'package:repo_list/domain/entity/repositry_entity.dart';

class FavoriteListAdapter extends TypeAdapter<List<RepositoryEntity>> {
  @override
  final int typeId = 0;

  @override
  List<RepositoryEntity> read(BinaryReader reader) {
    final length = reader.readInt();
    final list = List<RepositoryEntity>.generate(length, (_) => reader.read());
    return list;
  }

  @override
  void write(BinaryWriter writer, List<RepositoryEntity> obj) {
    writer.writeInt(obj.length);
    obj.forEach(writer.write);
  }
}
