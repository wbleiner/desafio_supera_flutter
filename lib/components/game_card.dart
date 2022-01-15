import 'package:desafio_supera_flutter/components/score.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:desafio_supera_flutter/models/game_list.dart';
import 'package:desafio_supera_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameItem loadedGame = Provider.of<GameItem>(context);
    final GameList gameList = Provider.of<GameList>(context, listen: false);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            offset: Offset(3, 2),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed(
              AppRoutes.DETAILS,
              arguments: loadedGame,
            ),
            child: Column(
              children: [
                Container(
                  child: Hero(
                    tag: loadedGame.id,
                    child: Image.asset(
                      'assets/images/items/${loadedGame.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: Text(
                    loadedGame.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontFamily: 'RobotoCondensed',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Score(score: loadedGame.score),
          Row(
            children: [
              Text(
                'R\$ ${loadedGame.price.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {
                  loadedGame.toggleFavorite();
                  gameList.filterFavorite();
                },
                icon: Icon(
                  loadedGame.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: loadedGame.isFavorite ? Colors.red : Colors.black,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
    );
  }
}
