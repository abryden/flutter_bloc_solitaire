part of 'klondike_bloc.dart';

abstract class KlondikeEvent {
  const KlondikeEvent();
}

abstract class GameStartEvent extends KlondikeEvent {}

abstract class CardDragEvent extends KlondikeEvent {
  final CardPile fromPile;
  final CardPile toPile;
  final PCard card;
  CardDragEvent({this.fromPile, this.toPile, this.card});
}
