import 'package:hive/hive.dart';

class SearchStoryAdapter extends TypeAdapter<List<String>> {
  @override
  final int typeId = 2;

  @override
  List<String> read(BinaryReader reader) {
    final length = reader.readByte();
    final List<String> searchQueries = [];
    for (var i = 0; i < length; i++) {
      final searchRequest = reader.readString();
      searchQueries.add(searchRequest);
    }
    return searchQueries;
  }

  @override
  void write(BinaryWriter writer, List<String> obj) {
    writer.writeByte(obj.length);
    for (var i = 0; i < obj.length; i++) {
      writer.writeString(obj[i]);
    }
  }
}
