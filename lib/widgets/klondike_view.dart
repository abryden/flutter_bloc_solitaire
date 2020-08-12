import 'package:bryden_solitaire/models/klondike.dart';
import 'package:bryden_solitaire/widgets/card_stack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:bryden_solitaire/cubit/klondike_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlondikeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('KLONDIKE')),
      body: Center(
        child: BlocBuilder<KlondikeCubit, KlondikeState>(
          builder: (context, state) {
            if (state is KlondikeInitial) {
              return FlatButton(
                child: Text('START GAME'),
                onPressed: () {
                  context.bloc<KlondikeCubit>().getNewGame();
                },
              );
            }
            if (state is KlondikeGameState) {
              return Column(
                children: <Widget>[
                  Text('GAME STARTED'),
                  Row(
                    children: [
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau1],
                          CardPile.tableau1,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau2],
                          CardPile.tableau2,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau3],
                          CardPile.tableau3,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau4],
                          CardPile.tableau4,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau5],
                          CardPile.tableau5,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau6],
                          CardPile.tableau6,
                          context),
                      buildCardStack(
                          state.klondike.cardPiles[CardPile.tableau7],
                          CardPile.tableau7,
                          context),
                    ],
                  ),
                  Text('NUM CARDS TABLEAU1:' +
                      state.klondike.cardPiles[CardPile.tableau1].length
                          .toString()),
                  Text('NUM CARDS TABLEAU22:' +
                      state.klondike.cardPiles[CardPile.tableau2].length
                          .toString()),
                  Text('NUM CARDS TABLEAU33:' +
                      state.klondike.cardPiles[CardPile.tableau3].length
                          .toString()),
                  Text('NUM CARDS TABLEAU4:' +
                      state.klondike.cardPiles[CardPile.tableau4].length
                          .toString()),
                  Text('NUM CARDS TABLEAU5:' +
                      state.klondike.cardPiles[CardPile.tableau5].length
                          .toString()),
                  Text('NUM CARDS TABLEAU61:' +
                      state.klondike.cardPiles[CardPile.tableau6].length
                          .toString()),
                  Text('NUM CARDS TABLEAU7:' +
                      state.klondike.cardPiles[CardPile.tableau7].length
                          .toString()),
                  FlatButton(
                      child: Text('END GAME'),
                      onPressed: () {
                        context.bloc<KlondikeCubit>().endGame();
                      })
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
