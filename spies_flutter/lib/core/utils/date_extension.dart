import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  DateTime get _getDate => DateTime(year, month, day);
  int get _getDifferenceDay =>
      DateTime.now()._getDate.difference(_getDate).inDays;

  String getDateLabel(String format) {
    return switch (_getDifferenceDay) {
      0 => 'Сегодня',
      1 => 'Вчера',
      _ => getFormatedDate(format),
    };
  }

  String getFormatedDate(String format) =>
      DateFormat(format, 'RU_ru').format(this);
}
