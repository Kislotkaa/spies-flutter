import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/src/generated/protocol.dart';

class GameSession {
  final GameData game;
  final String channelName;

  GameSession({
    required this.game,
    required this.channelName,
  });

  UuidValue get getId => game.id;
  String get getCode => game.code;
  List<WordCategoryData> get wordCategories => game.wordCategoryList;

  void finish() => game.status = GameStatus.finished;

  void start() => game.status = GameStatus.processing;

  void connectPlayer(UserData player) => game.playerList.add(player);

  void disconnectPlayer(UserData player) => game.playerList.removeWhere((e) => e.id == player.id);

  void setSettings(
    List<WordCategoryData> categories,
    bool? isShowWordHint,
    bool? isSubmittedUserWord,
  ) async {
    game.wordCategoryList = categories;
    game.isShowWordHint = isShowWordHint ?? game.isShowWordHint;
    game.isSubmittedUserWord = isSubmittedUserWord ?? game.isSubmittedUserWord;
  }

  void suggestWord(WordData word) => game.suggestWord = word;

  void suggestAccepted() {
    game.nextWord = game.suggestWord;
    game.suggestWord = null;
  }

  void nextWord(WordData word) {
    game.currentWord = game.nextWord;
    game.suggestWord = null;
    game.nextWord = word;
  }

  void checkPermission(UuidValue ownerId) {
    if (game.owner.id != ownerId) {
      throw ExceptionResponse(
        title: 'Вы не лидер комнаты',
      );
    }
  }
}
