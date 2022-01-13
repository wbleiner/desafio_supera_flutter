import 'package:desafio_supera_flutter/components/carousel.dart';
import 'package:desafio_supera_flutter/components/game_card.dart';

import '../data/dummy_data.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<GameItem> gamesLoaded = dummyGames;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: [
        CarouselSliderGames(),
        GridView.builder(
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            bottom: 8,
          ),
          physics: NeverScrollableScrollPhysics(),
          itemCount: gamesLoaded.length,
          shrinkWrap: true,
          itemBuilder: (ctx, i) => GameCard(gameLoaded: gamesLoaded[i]),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.55,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
        ),
      ],
    );
  }
}
