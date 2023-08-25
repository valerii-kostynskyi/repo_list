import 'package:hive/hive.dart';
import 'package:repo_list/data/model/search_story_model.dart';

class SearchStoryListModelAdapter extends TypeAdapter<List<SearchStoryModel>> {
  @override
  final int typeId = 2;

  @override
  List<SearchStoryModel> read(BinaryReader reader) {
    final length = reader.readByte();
    final List<SearchStoryModel> searchQueries = [];
    for (var i = 0; i < length; i++) {
      final query = reader.readString();
      searchQueries.add(SearchStoryModel(query: query));
    }
    return searchQueries;
  }

  @override
  void write(BinaryWriter writer, List<SearchStoryModel> obj) {
    writer.writeByte(obj.length);
    for (var i = 0; i < obj.length; i++) {
      writer.writeString(obj[i].query);

    }
  }
}
