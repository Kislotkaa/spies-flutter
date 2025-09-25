import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/src/features/endpoints/game_endpoint.dart';
import 'package:serverpod_flutter_server/src/generated/protocol.dart';

class GameEndedSheduller extends FutureCall<GameUuidEntity> {
  @override
  Future<void> invoke(Session session, GameUuidEntity? object) async {
    if (object == null) throw 'Ошибка GameEndedSheduller';

    GameData? game = await GameData.db.findById(session, object.uuid);

    if (game == null) throw 'Игра не найдена';

    game = game.copyWith(status: GameStatus.finished);
    GameEndpoint.gameSessions.removeWhere((e) => e.getId == game!.id);

    await GameData.db.updateRow(session, game);
  }
}
