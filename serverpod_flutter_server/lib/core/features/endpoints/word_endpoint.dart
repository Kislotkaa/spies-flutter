import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/core/extends/data_extends.dart';

import 'package:serverpod_flutter_server/src/generated/protocol.dart';

class WordEndpoint extends Endpoint {
  Future<List<WordResponse>> getWords(Session session) async {
    final words = await WordData.db.find(session);

    return words.map((e) => e.toResponse()).toList();
  }

  Future<WordResponse> addWord(Session session, AddWordRequest model) async {
    final word = await WordData.db.insertRow(
      session,
      WordData(
        word: model.word,
        hint: model.hint,
        wordCategoryId: model.wordCategoryId,
      ),
    );

    return word.toResponse();
  }

  Future<List<WordCategoryResponse>> getCategories(Session session) async {
    final listCategoryData = await WordCategoryData.db.find(session);
    return listCategoryData.map((e) => e.toResponse()).toList();
  }

  Future<WordCategoryResponse> addCategory(Session session, AddCategoryRequest model) async {
    final category = await WordCategoryData.db.insertRow(session, WordCategoryData(name: model.name));
    return category.toResponse();
  }
}
