import 'package:collection/collection.dart';
import 'package:serverpod_flutter_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Game endpoint', (sessionBuilder, endpoints) {
    final gameName = 'Тестовая игра';
    test(
      'create',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id',
            name: 'Тестовый аккаунт',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final game = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        expect(game.name, gameName);

        final isHaveCategory = game.wordCategoryList.firstWhereOrNull((e) => e.id == category.id) != null;

        expect(true, isHaveCategory);

        final gameInfo = await endpoints.game.getInfo(
          sessionBuilder,
          game.id,
        );

        expect(gameInfo?.id, game.id);
        expect(gameInfo?.name, gameName);
      },
    );

    test(
      'getInfo',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id',
            name: 'Тестовый аккаунт',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final game = await endpoints.game.getInfo(sessionBuilder, result.id);

        expect(game?.id, result.id);
      },
    );

    test(
      'start',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id',
            name: 'Тестовый аккаунт',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        await endpoints.word.addWord(
          sessionBuilder,
          AddWordRequest(
            word: 'Гарри поттер',
            wordCategoryId: category.id,
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.start(
          sessionBuilder,
          StartGameRequest(
            gameId: result.id,
            userId: result.owner.id,
          ),
        );

        final subScribeGame = await subscription;
        expect(subScribeGame.status, GameStatus.processing);

        final game = await endpoints.game.getInfo(
          sessionBuilder,
          result.id,
        );

        expect(game?.status, GameStatus.processing);
      },
    );

    test(
      'close',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id',
            name: 'Тестовый аккаунт',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.finish(
          sessionBuilder,
          FinishGameRequest(
            gameId: result.id,
            userId: result.owner.id,
          ),
        );

        final subScribeGame = await subscription;
        expect(subScribeGame.status, GameStatus.finished);

        final game = await endpoints.game.getInfo(
          sessionBuilder,
          result.id,
        );

        expect(game?.status, GameStatus.finished);
      },
    );

    test(
      'connect',
      () async {
        final user1 = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final user2 = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_2',
            name: 'Тестовый аккаунт 2',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user1.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.connect(
          sessionBuilder,
          ConnectGameRequest(
            code: result.code,
            playerId: user2.id,
          ),
        );

        final subScribeGame = await subscription;
        expect(subScribeGame.playerList.length, 2);

        final game = await endpoints.game.getInfo(
          sessionBuilder,
          result.id,
        );

        expect(game?.playerList.length, 2);
      },
    );

    test(
      'disconnect',
      () async {
        final user1 = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user1.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.disconnect(
          sessionBuilder,
          DisconnectGameRequest(
            playerId: user1.id,
            gameId: result.id,
          ),
        );

        final subScribeGame = await subscription;
        expect(subScribeGame.playerList.length, 0);

        final game = await endpoints.game.getInfo(
          sessionBuilder,
          result.id,
        );

        expect(game?.playerList.length, 0);
      },
    );
    test(
      'change settings',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        expect(result.isShowWordHint, true);
        expect(result.isSubmittedUserWord, true);
        expect(result.wordCategoryList.first.id, category.id);

        await endpoints.game.changeSettings(
          sessionBuilder,
          ChangeGameSettingsRequest(
            gameId: result.id,
            userId: user.id,
            isShowWordHint: false,
            isSubmittedUserWord: false,
            wordCategoryIds: [],
          ),
        );

        final subScribeGame = await subscription;

        expect(subScribeGame.isShowWordHint, false);
        expect(subScribeGame.isSubmittedUserWord, false);
        expect(subScribeGame.wordCategoryList.isEmpty, true);

        final game = await endpoints.game.getInfo(
          sessionBuilder,
          result.id,
        );

        expect(game?.isShowWordHint, false);
        expect(game?.isSubmittedUserWord, false);
        expect(game?.wordCategoryList.isEmpty, true);
      },
    );

    test(
      'suggest word',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        final suggestWord = 'Предложенное слово';

        await endpoints.game.suggestWord(
          sessionBuilder,
          SuggestWordRequest(
            gameId: result.id,
            word: suggestWord,
          ),
        );

        final subScribeGame = await subscription;

        expect(subScribeGame.suggestWord?.word, suggestWord);
      },
    );

    test(
      'suggest accepted',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        final suggestWord = 'Предложенное слово';

        await endpoints.game.suggestWord(
          sessionBuilder,
          SuggestWordRequest(
            gameId: result.id,
            word: suggestWord,
          ),
        );

        final subScribeSuggest = await subscription;

        if (subScribeSuggest.suggestWord?.id == null) throw 'Ошибка в предложенном слове';

        final subscriptionSuggestAccepted = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.suggestAccepted(
          sessionBuilder,
          SuggestWordAcceptedRequest(
            gameId: result.id,
            userId: user.id,
          ),
        );

        final subScribeGame = await subscriptionSuggestAccepted;

        expect(subScribeGame.nextWord?.word, suggestWord);
        expect(subScribeGame.suggestWord?.word, null);
      },
    );

    test(
      'next word',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: 'test_device_id_1',
            name: 'Тестовый аккаунт 1',
          ),
        );

        final category = await endpoints.word.addCategory(
          sessionBuilder,
          AddCategoryRequest(
            name: 'Персонажи',
          ),
        );

        await endpoints.word.addWord(
          sessionBuilder,
          AddWordRequest(
            word: 'Гарри Поттер',
            wordCategoryId: category.id,
          ),
        );

        final result = await endpoints.game.create(
          sessionBuilder,
          CreateGameRequest(
            name: gameName,
            ownerId: user.id,
            wordCategoryIds: [category.id],
            isShowWordHint: true,
            isSubmittedUserWord: true,
          ),
        );

        final suggestWord = 'Предложенное слово';

        await endpoints.game.suggestWord(
          sessionBuilder,
          SuggestWordRequest(
            gameId: result.id,
            word: suggestWord,
          ),
        );

        await endpoints.game.suggestAccepted(
          sessionBuilder,
          SuggestWordAcceptedRequest(
            gameId: result.id,
            userId: user.id,
          ),
        );

        final subscription = endpoints.game.subscribe(sessionBuilder, result.id).first;

        await endpoints.game.nextWord(
          sessionBuilder,
          NextWordRequest(
            gameId: result.id,
            userId: user.id,
          ),
        );

        final subScribeGame = await subscription;

        expect(subScribeGame.currentWord?.word, suggestWord);
        expect(subScribeGame.suggestWord?.word, null);
      },
    );
  });
}
