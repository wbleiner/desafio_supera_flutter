import 'package:desafio_supera_flutter/components/game_grid.dart';
import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteGames = Provider.of<GameList>(context).gameFavoriteList;
    return SingleChildScrollView(
      child: GameGrid(
        loadedGames: favoriteGames,
      ),
    );
  }
}
