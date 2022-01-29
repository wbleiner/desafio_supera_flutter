import 'package:desafio_supera_flutter/components/game_grid.dart';
import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteGames = Provider.of<GameList>(context).gameFavoriteList;
    return favoriteGames.length == 0
        ? Center(
            child: Text(
              'Ops, você não tem nenhum jogo favorito.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : SingleChildScrollView(
            child: GameGrid(
              loadedGames: favoriteGames,
            ),
          );
  }
}
