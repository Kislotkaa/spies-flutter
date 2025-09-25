import 'dart:convert';

class UserModel {
  final String name;
  final String deviceId;

  UserModel({
    required this.name,
    required this.deviceId,
  });

  factory UserModel.fromJson(String source) {
    final map = json.decode(source) as Map<String, dynamic>;
    return UserModel(
      name: map['name'] as String,
      deviceId: map['deviceId'] as String,
    );
  }

  String toJson() => json.encode(
        {
          'name': name,
          'deviceId': deviceId,
        },
      );
}
