import 'package:spies/core/widgets/app_snackbar.dart';

class SnackbarModel {
  final String title;
  final String? description;
  final Duration? duration;
  final SnackStatusEnum status;
  final Function()? onTap;

  SnackbarModel({
    required this.title,
    this.description,
    this.duration,
    required this.status,
    this.onTap,
  });
}
