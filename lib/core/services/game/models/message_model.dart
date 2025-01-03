// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum MessageTypeEnum { suggestWord, startGame, connectGame, disconnectGame, check }

class MessageModel {
  final MessageTypeEnum type;
  final String? word;
  final String? name;

  MessageModel({
    required this.type,
    this.word,
    this.name,
  });

  MessageModel copyWith({
    MessageTypeEnum? type,
    String? word,
    String? name,
  }) {
    return MessageModel(
      type: type ?? this.type,
      word: word ?? this.word,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type.name,
      'word': toUtfList(word),
      'name': toUtfList(name),
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      type: MessageTypeEnum.values.firstWhere((type) => map['type'] == type.name),
      word: map['word'] != null ? fromUtfList(map['word'] as String) : null,
      name: map['name'] != null ? fromUtfList(map['name'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) {
    print(source);
    final map = json.decode(source) as Map<String, dynamic>;
    return MessageModel.fromMap(map);
  }

  static String fromUtfList(String stringUtf) {
    List<String> listUtfs = stringUtf.split('*');
    List<int> listInt = [];
    for (String element in listUtfs) {
      if (int.tryParse(element) != null) listInt.add(int.parse(element));
    }
    return utf8.decode(listInt);
  }

  static String toUtfList(String? ru) {
    return utf8.encode(ru ?? '').join('*');
  }
}
