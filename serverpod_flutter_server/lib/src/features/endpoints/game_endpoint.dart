import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/src/extends/data_extends.dart';
import 'package:serverpod_flutter_server/src/extends/random_extends.dart';
import 'package:serverpod_flutter_server/src/features/moduls/game_session.dart';
import 'package:serverpod_flutter_server/src/generated/protocol.dart';

class GameEndpoint extends Endpoint {
  String get _getRandomNumber => RandomExtends.getRandomNumber;

  static List<GameSession> gameSessions = [];

  Stream<GameResponse> subscribe(Session session, UuidValue gameId) async* {
    final stream = session.messages.createStream<GameResponse>(_getSteamChannelName(gameId));

    await for (final game in stream) {
      yield game;
    }
  }

  Future<GameResponse> create(Session session, CreateGameRequest model) async {
    final owner = await UserData.db.findById(session, model.ownerId);

    if (owner == null) {
      throw ExceptionResponse(
        title: 'Ошибка регистрации аккаунта',
        subTitle: 'Такого аккаунта не существует',
      );
    }

    final List<WordCategoryData> categories = [];
    for (final categoryId in model.wordCategoryIds) {
      final category = await WordCategoryData.db.findById(session, categoryId);
      if (category != null) categories.add(category);
    }

    final game = await GameData.db.insertRow(
      session,
      GameData(
        owner: owner,
        name: model.name,
        code: await _generateUniqueCode(session),
        wordCategoryList: categories,
        playerList: [owner],
        isShowWordHint: model.isShowWordHint,
        isSubmittedUserWord: model.isSubmittedUserWord,
      ),
    );

    gameSessions.add(
      GameSession(
        game: game,
        channelName: _getSteamChannelName(game.id),
      ),
    );

    await Serverpod.instance.futureCallWithDelay(
      'GameEndedSheduller',
      GameUuidEntity(uuid: game.id),
      const Duration(days: 1),
    );

    return game.toResponse();
  }

  Future<void> start(Session session, StartGameRequest model) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    gameSession.checkPermission(model.userId);

    gameSession.start();

    final word = await _getRandomWord(session, gameSession.wordCategories);
    gameSession.nextWord(word);

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<void> finish(Session session, FinishGameRequest model) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    gameSession.checkPermission(model.userId);

    gameSession.finish();

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<void> disconnect(
    Session session,
    DisconnectGameRequest model,
  ) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    UserData? player = await UserData.db.findById(
      session,
      model.playerId,
    );

    if (player == null) {
      throw ExceptionResponse(
        title: 'Ошибка регистрации аккаунта',
        subTitle: 'Такого игрока не существует',
      );
    }

    gameSession.disconnectPlayer(player);

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<GameResponse> connect(
    Session session,
    ConnectGameRequest model,
  ) async {
    final gameSession = _getGameSessionWithCode(model.code);

    UserData? player = await UserData.db.findById(
      session,
      model.playerId,
    );

    if (player == null) {
      throw ExceptionResponse(
        title: 'Ошибка регистрации аккаунта',
        subTitle: 'Такого игрока не существует',
      );
    }

    gameSession.connectPlayer(player);

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );

    return gameSession.game.toResponse();
  }

  Future<GameResponse> changeSettings(
    Session session,
    ChangeGameSettingsRequest model,
  ) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    gameSession.checkPermission(model.userId);

    final List<WordCategoryData> categories = gameSession.wordCategories;
    if (model.wordCategoryIds != null) {
      categories.clear();
      for (final categoryId in model.wordCategoryIds!) {
        final category = await WordCategoryData.db.findById(session, categoryId);
        if (category != null) categories.add(category);
      }
    }

    gameSession.setSettings(
      categories,
      model.isShowWordHint,
      model.isSubmittedUserWord,
    );

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );

    return gameSession.game.toResponse();
  }

  Future<void> suggestWord(
    Session session,
    SuggestWordRequest model,
  ) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    final word = await WordData.db.insertRow(
      session,
      WordData(
        word: model.word,
      ),
    );

    gameSession.suggestWord(word);

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<void> suggestAccepted(
    Session session,
    SuggestWordAcceptedRequest model,
  ) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    gameSession.checkPermission(model.userId);

    gameSession.suggestAccepted();

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<void> nextWord(
    Session session,
    NextWordRequest model,
  ) async {
    final gameSession = _getGameSessionWithId(model.gameId);

    gameSession.checkPermission(model.userId);

    final word = await _getRandomWord(session, gameSession.wordCategories);
    gameSession.nextWord(word);

    await GameData.db.updateRow(session, gameSession.game);

    await session.messages.postMessage(
      gameSession.channelName,
      gameSession.game.toResponse(),
    );
  }

  Future<GameResponse?> getInfo(Session session, UuidValue gameId) async {
    final game = await GameData.db.findById(session, gameId);
    return game?.toResponse();
  }

  Future<WordData> _getRandomWord(Session session, List<WordCategoryData> wordCategories) async {
    final randomCategory = wordCategories[RandomExtends.nextInt(wordCategories.length)];

    if (wordCategories.isEmpty) throw 'В базе отсутствуют КАТЕГОРИИ СЛОВ';

    final words = await WordData.db.find(
      session,
      where: (e) => e.wordCategoryId.equals(randomCategory.id),
    );

    if (words.isEmpty) throw 'В базе отсутствуют СЛОВА';

    return words[RandomExtends.nextInt(words.length)];
  }

  Future<String> _generateUniqueCode(Session session) async {
    bool isNotUnique = true;
    String code = '';

    final listGames = await GameData.db.find(session);

    while (isNotUnique) {
      code = '$_getRandomNumber$_getRandomNumber$_getRandomNumber$_getRandomNumber';
      if (listGames.firstWhereOrNull((e) => e.code == code) == null) {
        isNotUnique = false;
      }
    }

    return code;
  }

  GameSession _getGameSessionWithId(UuidValue gameId) {
    final gameSession = gameSessions.firstWhereOrNull((e) => e.getId == gameId);

    if (gameSession == null || gameSession.game.status == GameStatus.finished) {
      throw ExceptionResponse(
        title: 'Такой игры не существует',
        subTitle: 'Повторите попытку позже',
      );
    }

    return gameSession;
  }

  GameSession _getGameSessionWithCode(String code) {
    final gameSession = gameSessions.firstWhereOrNull((e) => e.getCode == code);

    if (gameSession == null || gameSession.game.status == GameStatus.finished) {
      throw ExceptionResponse(
        title: 'Такой игры не существует',
        subTitle: 'Повторите попытку позже',
      );
    }

    return gameSession;
  }

  String _getSteamChannelName(UuidValue gameId) => 'channel_game_$gameId';
}
