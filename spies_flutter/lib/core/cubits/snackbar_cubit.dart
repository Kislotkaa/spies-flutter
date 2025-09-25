import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/core/widgets/button_widget.dart';
import 'package:sample/core/widgets/snackbar_widget.dart';
import 'package:sample/locator.dart';

SnackBarCubit get snackBar => sl<SnackBarCubit>();

class SnackBarCubit extends Cubit<SnackbarState> {
  SnackBarCubit() : super(const SnackbarState());

  void show(SnackbarModel snackbarModel) => emit(SnackbarState(snackbarModel: snackbarModel));
}

class SnackbarState {
  final SnackbarModel? snackbarModel;
  const SnackbarState({this.snackbarModel});
}

class SnackbarModel {
  final String title;
  final String? subTitle;
  final Duration duration;
  final SnackbarStatus status;
  final SnackbarButtonModel? button;
  final bool withFeedBack;

  SnackbarModel({
    required this.title,
    this.subTitle,
    this.button,
    this.duration = const Duration(seconds: 4),
    this.status = SnackbarStatus.normal,
    this.withFeedBack = false,
  });
}

class SnackbarButtonModel {
  final Function() onTap;
  final String? text;
  final ButtonStateEnum state;

  SnackbarButtonModel({
    required this.onTap,
    this.text,
    this.state = ButtonStateEnum.fill,
  });
}
