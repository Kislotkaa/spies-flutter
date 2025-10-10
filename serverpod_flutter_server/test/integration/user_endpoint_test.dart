import 'package:serverpod_flutter_server/src/generated/protocol.dart';
import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('User endpoint', (sessionBuilder, endpoints) {
    final deviceId = 'test_device_id';
    test(
      'signIn',
      () async {
        final user = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: deviceId,
            name: 'Тестовый номер',
          ),
        );

        expect(user.deviceId, deviceId);
      },
    );

    test(
      'getUser',
      () async {
        await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: deviceId,
            name: 'Тестовый номер',
          ),
        );

        final user = await endpoints.user.getUser(
          sessionBuilder,
          GetUserRequest(
            deviceId: deviceId,
          ),
        );

        expect(user?.deviceId, deviceId);
      },
    );

    test(
      'signOut',
      () async {
        final result = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: deviceId,
            name: 'Тестовый номер',
          ),
        );

        await endpoints.user.signOut(
          sessionBuilder,
          result.id,
        );

        final user = await endpoints.user.getUser(
          sessionBuilder,
          GetUserRequest(
            deviceId: deviceId,
          ),
        );

        expect(user, null);
      },
    );

    test(
      'changeName',
      () async {
        final newName = 'Новое имя';

        final result = await endpoints.user.signIn(
          sessionBuilder,
          SignInRequest(
            deviceId: deviceId,
            name: 'Тестовый номер',
          ),
        );

        await endpoints.user.changeName(
          sessionBuilder,
          ChangeNameRequest(
            userId: result.id,
            newName: newName,
          ),
        );

        final user = await endpoints.user.getUser(
          sessionBuilder,
          GetUserRequest(
            deviceId: deviceId,
          ),
        );

        expect(user?.name, newName);
      },
    );
  });
}
