import 'package:flutter/material.dart';

enum CardSuit { hearts, diamonds, clubs, spades, joker }

enum CardColor { red, black, neutral }

enum CardRank {
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
  ten,
  jack,
  queen,
  king,
  ace
}

enum CardType { numberCard, faceCard, aceCard }

class PCard {
  CardSuit cardSuit;
  CardRank cardRank;
  bool faceUp;

  PCard(
      {@required this.cardSuit, @required this.cardRank, this.faceUp = false});
  CardColor get cardColor {
    if (cardSuit == CardSuit.diamonds || cardSuit == CardSuit.hearts) {
      return CardColor.red;
    } else if (cardSuit == CardSuit.clubs || cardSuit == CardSuit.spades) {
      return CardColor.black;
    } else {
      return CardColor.neutral;
    }
  }

  String get AsettName {
    String assetName = "images/";
    if (!faceUp) {
      assetName += "back.png";
      return assetName;
    }
    switch (cardRank) {
      case CardRank.two:
        assetName += "2_of_";
        break;
      case CardRank.three:
        assetName += "3_of_";
        break;
      case CardRank.four:
        assetName += "4_of_";
        break;
      case CardRank.five:
        assetName += "5_of_";
        break;
      case CardRank.six:
        assetName += "6_of_";
        break;
      case CardRank.seven:
        assetName += "7_of_";
        break;
      case CardRank.eight:
        assetName += "8_of_";
        break;
      case CardRank.nine:
        assetName += "9_of_";
        break;
      case CardRank.ten:
        assetName += "10_of_";
        break;
      case CardRank.jack:
        assetName += "jack_of_";
        break;
      case CardRank.queen:
        assetName += "queen_of_";
        break;
      case CardRank.king:
        assetName += "king_of_";
        break;
      case CardRank.ace:
        assetName += "ace_of_";
        break;
    }
    switch (cardSuit) {
      case CardSuit.hearts:
        assetName += "hearts.png";
        break;
      case CardSuit.diamonds:
        assetName += "diamonds.png";
        break;
      case CardSuit.clubs:
        assetName += "clubs.png";
        break;
      case CardSuit.spades:
        assetName += "spades.png";
        break;
      case CardSuit.joker:
        break;
    }
    return assetName;
  }
}
