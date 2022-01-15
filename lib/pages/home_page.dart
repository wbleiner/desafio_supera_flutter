import 'package:desafio_supera_flutter/components/carousel.dart';
import 'package:desafio_supera_flutter/components/game_grid.dart';
import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:provider/provider.dart';

import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GameList>(context);
    final List<GameItem> loadedGames = provider.gameList;
    return ListView(
      padding: EdgeInsets.only(top: 10),
      children: [
        CarouselSliderGames(),
        GameGrid(loadedGames: loadedGames),
      ],
    );
  }
}
