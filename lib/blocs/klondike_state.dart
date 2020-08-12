part of 'klondike_bloc.dart';

@immutable
abstract class KlondikeState extends Equatable {
  const KlondikeState();

  @override
  List<Object> get props => [];
}

class KlondikeInitial extends KlondikeState {}

class KlondikeVictory extends KlondikeState {}

class KlondikeGameState extends KlondikeState {
  final Klondike klondike;
  const KlondikeGameState({this.klondike}) : assert(klondike != null);

  @override
  List<Object> get props => [klondike];
}
