import 'dart:io';

class ClienErrorModel {
  final Socket client;
  final String error;

  ClienErrorModel({required this.client, required this.error});
}
