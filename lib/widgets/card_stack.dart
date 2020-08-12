import 'package:bryden_solitaire/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:bryden_solitaire/cubit/klondike_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardStack extends StatelessWidget {
  final List<PCard> cards;

  const CardStack({Key key, this.cards})
      : assert(cards != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 50,
        margin: EdgeInsets.all(2.0),
        child: Stack(
          children: cards.map((card) {
            return Positioned(
                top: cards.indexOf(card) * 20.0,
                child: Draggable(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      card.AsettName,
                      scale: 6,
                    ),
                  ),
                  feedback: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      card.AsettName,
                      scale: 6,
                    ),
                  ),
                  childWhenDragging: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                ));
          }).toList(),
        ));
  }
}

DragTarget buildCardStack(
    List<PCard> cards, CardPile pile, BuildContext context) {
  return DragTarget(
    builder: (context, candidateData, rejectedData) {
      return Container(
        height: 300,
        width: 50,
        child: buildRecursiveStack(cards, 0, pile),
      );
    },
    onAccept: (data) {
      CardDragEvent d = data.copyWith(toPile: pile);
      context.bloc<KlondikeCubit>().dragCards(d);
    },
  );
}

Draggable buildRecursiveStack(List<PCard> cards, int depth, CardPile pile) {
  if (cards.length == 0) {
    return null;
  }
  PCard card = cards.first;
  List<PCard> ncards = new List<PCard>.from(cards);
  ncards.removeAt(0);
  // if (true) {
  return Draggable(
      data:
          CardDragEvent(card: card, cardsInDrag: cards.length, fromPile: pile),
      childWhenDragging: Container(),
      feedback: Container(
        height: 300,
        width: 50,
        child: Stack(
          children: cards.map((card) {
            return Positioned(
                top: 20.0 * depth + 20.0 * cards.indexOf(card),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: Image.asset(
                      card.AsettName,
                      scale: 6,
                    )));
          }).toList(),
        ),
      ),
      child: Stack(children: () {
        List<Widget> a = [
          Positioned(
              top: 20.0 * depth,
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Image.asset(
                    card.AsettName,
                    scale: 6,
                  ))),
          buildRecursiveStack(ncards, depth + 1, pile),
        ];
        a.removeWhere((value) => value == null);
        return a;
      }()));
  //}
  // else {
  //   return Stack(children: () {
  //     List<Widget> a = [
  //       Positioned(
  //           top: 20.0 * depth,
  //           child: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(4.0),
  //                 color: Colors.white,
  //                 border: Border.all(color: Colors.black),
  //               ),
  //               child: Image.asset(
  //                 card.AsettName,
  //                 scale: 6,
  //               ))),
  //       buildRecursiveStack(ncards, depth + 1, pile),
  //     ];
  //     a.removeWhere((value) => value == null);
  //     return a;
  //   }());
  //}
}
