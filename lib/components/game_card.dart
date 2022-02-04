import 'package:desafio_supera_flutter/components/score.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:desafio_supera_flutter/providers/game_item_provider.dart';
import 'package:desafio_supera_flutter/providers/game_list_provider.dart';
import 'package:desafio_supera_flutter/utils/app_routes.dart';
import 'package:desafio_supera_flutter/utils/score_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    final GameItem loadedGame = Provider.of<GameItem>(context);
    final GameList gameList = Provider.of<GameList>(context, listen: false);
    void onToggleFavorite() {
      loadedGame.toggleFavorite();
      gameList.filterFavorite();
    }

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChangeNotifierProvider.value(
            value: loadedGame,
            child: GestureDetector(
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
                        height: MediaQuery.of(context).size.height * 0.31,
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
                        fontFamily: 'RobotoCondensed',
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Score(
                scoreType: ScoreTypes.REDUCED,
                score: loadedGame.score,
              ),
              Text(
                'R\$ ${loadedGame.price.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontFamily: 'DMSans',
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  onToggleFavorite();
                },
                icon: Icon(
                  loadedGame.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: loadedGame.isFavorite ? Colors.red : Colors.grey,
                ),
              ),
              IconButton(
                onPressed: () {
                  cart.addItem(loadedGame);
                },
                icon: Icon(Icons.add_shopping_cart),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
