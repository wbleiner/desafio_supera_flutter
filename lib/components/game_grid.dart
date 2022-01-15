import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_card.dart';

class GameGrid extends StatelessWidget {
  const GameGrid({
    Key? key,
    required this.loadedGames,
  }) : super(key: key);

  final List<GameItem> loadedGames;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
      ),
      physics: NeverScrollableScrollPhysics(),
      itemCount: loadedGames.length,
      shrinkWrap: true,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: loadedGames[i],
        child: GameCard(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
