import 'package:serverpod_flutter_server/src/generated/protocol.dart';

extension ResponseUserData on UserData {
  UserResponse toResponse() => UserResponse(
        id: id,
        deviceId: deviceId,
        name: name,
      );
}

extension ResponseGameData on GameData {
  GameResponse toResponse() => GameResponse(
        id: id,
        name: name,
        code: code,
        status: status,
        owner: owner.toResponse(),
        currentWord: currentWord?.toResponse(),
        suggestWord: suggestWord?.toResponse(),
        nextWord: nextWord?.toResponse(),
        wordCategoryList: wordCategoryList.map((e) => e.toResponse()).toList(),
        playerList: playerList.map((e) => e.toResponse()).toList(),
        isShowWordHint: isShowWordHint,
        isSubmittedUserWord: isSubmittedUserWord,
      );
}

extension ResponseWordCategoryData on WordCategoryData {
  WordCategoryResponse toResponse() => WordCategoryResponse(
        id: id,
        name: name,
      );
}

extension ResponseWordData on WordData {
  WordResponse toResponse() => WordResponse(
        id: id,
        word: word,
        wordCategory: wordCategory?.toResponse(),
      );
}
