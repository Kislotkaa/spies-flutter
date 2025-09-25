import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/locator.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

void run(List<String> args) async {
  initModules();

  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  initRoutes(pod);

  await pod.start();

  initShedullers(pod);
}
