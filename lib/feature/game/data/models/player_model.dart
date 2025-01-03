class PlayerModel {
  final String? name;
  final String ip;
  final int? port;

  PlayerModel({
    this.name,
    required this.ip,
    required this.port,
  });

  PlayerModel copyWith({
    String? name,
    String? ip,
    int? port,
  }) {
    return PlayerModel(
      name: name,
      ip: ip ?? this.ip,
      port: port ?? this.port,
    );
  }
}
