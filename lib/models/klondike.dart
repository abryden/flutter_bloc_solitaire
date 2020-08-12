import 'models.dart';

enum CardPile {
  tableau1,
  tableau2,
  tableau3,
  tableau4,
  tableau5,
  tableau6,
  tableau7,
  heartsFoundation,
  diamondFoundation,
  clubsFoundation,
  spadesFoundation,
  downPile,
  upPile
}

class Klondike {
  Map<CardPile, List<PCard>> cardPiles = {
    CardPile.tableau1: [],
    CardPile.tableau2: [],
    CardPile.tableau3: [],
    CardPile.tableau4: [],
    CardPile.tableau5: [],
    CardPile.tableau6: [],
    CardPile.tableau7: [],
    CardPile.heartsFoundation: [],
    CardPile.diamondFoundation: [],
    CardPile.clubsFoundation: [],
    CardPile.spadesFoundation: [],
    CardPile.downPile: [],
    CardPile.upPile: [],
  };

  bool isVictory;

  Klondike();
}
