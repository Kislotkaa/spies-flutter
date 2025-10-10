import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/core/features/shedullers/game_ended_sheduller.dart';

void initModules() {}

void initShedullers(Serverpod pod) {
  pod.registerFutureCall(
    GameEndedSheduller(),
    'GameEndedSheduller',
  );
}

void initRoutes(Serverpod pod) {}
