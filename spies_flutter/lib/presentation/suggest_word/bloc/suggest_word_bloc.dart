import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'suggest_word_event.dart';
part 'suggest_word_state.dart';

class SuggestWordBloc extends Bloc<SuggestWordEvent, SuggestWordState> {
  SuggestWordBloc() : super(SuggestWordInitialState()) {
    on<SuggestWordInitialEvent>(_init);
  }

  FutureOr<void> _init(SuggestWordInitialEvent event, emit) {}
}
