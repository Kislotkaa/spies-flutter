import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitialState()) {
    on<MainInitialEvent>(_init);
  }

  FutureOr<void> _init(MainInitialEvent event, emit) {}
}
