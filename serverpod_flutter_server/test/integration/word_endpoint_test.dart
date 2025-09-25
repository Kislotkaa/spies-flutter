import 'package:serverpod_flutter_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Game endpoint', (sessionBuilder, endpoints) {
    final categoryName = 'Персонажи';
    final wordName = 'Гарри поттер';

    test(
      'addCategory',
      () async {
        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: categoryName,
          ),
        );

        expect(category.name, categoryName);
      },
    );

    test(
      'addWord',
      () async {
        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: categoryName,
          ),
        );

        final wordResponse = await endpoints.word.addWord(
          sessionBuilder,
          AddWordRequest(
            word: wordName,
            wordCategoryId: category.id,
          ),
        );

        expect(wordResponse.word, wordName);

        final words = await endpoints.word.getWords(sessionBuilder);

        expect(words.first.id, wordResponse.id);
      },
    );

    test(
      'getWords',
      () async {
        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: categoryName,
          ),
        );

        await endpoints.word.addWord(
          sessionBuilder,
          AddWordRequest(
            word: wordName,
            wordCategoryId: category.id,
          ),
        );

        final words = await endpoints.word.getWords(sessionBuilder);

        expect(words.length, 1);
      },
    );
  });
}
