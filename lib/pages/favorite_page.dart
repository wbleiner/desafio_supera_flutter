import 'package:desafio_supera_flutter/components/game_grid.dart';

import 'package:desafio_supera_flutter/providers/game_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteGames = Provider.of<GameList>(context).gameFavoriteList;
    return favoriteGames.length == 0
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/background/broken-heart.png',
                  scale: 4,
                  color: Colors.black26,
                ),
                SizedBox(height: 20),
                Text(
                  'Ops, sua lista de favoritos está vazia.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        : SingleChildScrollView(
            child: GameGrid(
              loadedGames: favoriteGames,
            ),
          );
  }
}
