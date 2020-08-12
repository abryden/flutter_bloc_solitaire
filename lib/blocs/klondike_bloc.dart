import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bryden_solitaire/models/models.dart';
part 'klondike_event.dart';
part 'klondike_state.dart';

class KlondikeBloc extends Bloc<KlondikeEvent, KlondikeState> {
  KlondikeBloc() : super(KlondikeInitial());

  @override
  Stream<KlondikeState> mapEventToState(
    KlondikeEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is CardDragEvent) {}
  }
}
