import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bryden_solitaire/models/models.dart';
import 'dart:math';

part 'klondike_state.dart';

class CardDragEvent {
  final CardPile fromPile;
  final CardPile toPile;
  final PCard card;
  final int cardsInDrag;
  CardDragEvent({this.cardsInDrag, this.fromPile, this.toPile, this.card});

  copyWith({int cardsInDrag, CardPile fromPile, CardPile toPile, PCard card}) {
    return CardDragEvent(
        cardsInDrag: cardsInDrag ?? this.cardsInDrag,
        fromPile: fromPile ?? this.fromPile,
        toPile: toPile ?? this.toPile,
        card: card ?? this.card);
  }
}

class KlondikeCubit extends Cubit<KlondikeState> {
  KlondikeCubit() : super(KlondikeInitial());
  void dragCards(CardDragEvent event) {
    KlondikeGameState gameState = state as KlondikeGameState;
    Klondike k = new Klondike();

    for (int i = 0; i < CardPile.values.length; i++) {
      k.cardPiles[CardPile.values[i]] = new List<PCard>.from(
          gameState.klondike.cardPiles[CardPile.values[i]]);
    }
    k.cardPiles[event.toPile].addAll(k.cardPiles[event.fromPile]
        .sublist(k.cardPiles[event.fromPile].length - event.cardsInDrag));
    k.cardPiles[event.fromPile].removeRange(
        k.cardPiles[event.fromPile].length - event.cardsInDrag,
        k.cardPiles[event.fromPile].length);

    emit(KlondikeGameState(klondike: k));
  }

  void endGame() {
    emit(KlondikeInitial());
  }

  void getNewGame() {
    Klondike klondike = shuffle();
    emit(KlondikeGameState(klondike: klondike));
  }
}

final Random random = new Random();
Klondike shuffle() {
  List<PCard> unShuffledCards = new List<PCard>();
  Klondike klondike = new Klondike();
  for (int i = 0; i < 4; i++) {
    for (int k = 0; k < CardRank.values.length; k++) {
      unShuffledCards.add(
          PCard(cardRank: CardRank.values[k], cardSuit: CardSuit.values[i]));
    }
  }
  for (int i = 0; i < 7; i++) {
    for (int k = 0; k <= i; k++) {
      int nextIndex = random.nextInt(unShuffledCards.length);
      PCard nextCard = unShuffledCards[nextIndex];
      unShuffledCards.removeAt(nextIndex);
      if (k != i) {
        klondike.cardPiles[CardPile.values[i]].add(nextCard);
      } else {
        klondike.cardPiles[CardPile.values[i]].add(PCard(
            cardRank: nextCard.cardRank,
            cardSuit: nextCard.cardSuit,
            faceUp: true));
      }
    }
  }

  while (unShuffledCards.length > 0) {
    int nextIndex = random.nextInt(unShuffledCards.length);
    PCard nextCard = unShuffledCards[nextIndex];
    unShuffledCards.removeAt(nextIndex);
    klondike.cardPiles[CardPile.downPile].add(nextCard);
  }

  klondike.cardPiles[CardPile.clubsFoundation]
      .add(PCard(cardRank: CardRank.ace, cardSuit: CardSuit.hearts));
  klondike.cardPiles[CardPile.diamondFoundation]
      .add(PCard(cardRank: CardRank.eight, cardSuit: CardSuit.hearts));

  //starts me at this indentation level after I press enter on the previous line

  //see I had to press back twice
  return klondike;
}
