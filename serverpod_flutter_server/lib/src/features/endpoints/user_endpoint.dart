import 'package:serverpod/serverpod.dart';
import 'package:serverpod_flutter_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<UserResponse?> getUser(Session session, GetUserRequest model) async {
    final user = await UserData.db.findFirstRow(
      session,
      where: (e) => e.deviceId.equals(model.deviceId),
    );

    return user?.toResponse();
  }

  Future<UserResponse> signIn(Session session, SignInRequest model) async {
    UserData? user = await UserData.db.findFirstRow(
      session,
      where: (e) => e.deviceId.equals(model.deviceId),
    );

    if (user == null) {
      user = await UserData.db.insertRow(
        session,
        UserData(
          deviceId: model.deviceId,
          name: model.name,
        ),
      );
    } else {
      user.updateAt = DateTime.now();
      await UserData.db.updateRow(
        session,
        user,
      );
    }

    return user.toResponse();
  }

  Future<void> signOut(Session session, SignOutRequest model) async {
    UserData? user = await UserData.db.findById(session, model.userId);

    if (user != null) await UserData.db.deleteRow(session, user);
  }

  Future<void> changeName(Session session, ChangeNameRequest model) async {
    UserData? user = await UserData.db.findFirstRow(
      session,
      where: (e) => e.id.equals(model.userId),
    );

    if (user == null) {
      throw ExceptionResponse(title: 'Такого пользователя не существует');
    }

    user = user.copyWith(name: model.newName);

    await UserData.db.updateRow(
      session,
      user,
    );
  }
}

extension on UserData {
  UserResponse toResponse() => UserResponse(
        id: id,
        deviceId: deviceId,
        name: name,
      );
}
