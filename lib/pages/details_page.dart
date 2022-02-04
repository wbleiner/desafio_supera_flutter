import 'package:desafio_supera_flutter/components/score.dart';
import 'package:desafio_supera_flutter/providers/cart_provider.dart';
import 'package:desafio_supera_flutter/providers/game_item_provider.dart';
import 'package:desafio_supera_flutter/providers/game_list_provider.dart';
import 'package:desafio_supera_flutter/utils/score_types.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameList gameList = Provider.of<GameList>(context);
    final Cart cartList = Provider.of<Cart>(context, listen: false);
    final GameItem game =
        ModalRoute.of(context)!.settings.arguments as GameItem;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Hero(
              tag: game.id,
              child: Image.asset(
                'assets/images/items/${game.image}',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  game.name,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Score(
                          scoreType: ScoreTypes.TOTAL,
                          score: game.score,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'R\$ ${game.price.toStringAsFixed(2).replaceAll('.', ',')}',
                          style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w900,
                            fontSize: 28,
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      color: game.isFavorite ? Colors.red : Colors.grey,
                      iconSize: 45,
                      padding: const EdgeInsets.only(right: 10),
                      icon: Icon(
                        game.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                      ),
                      onPressed: () {
                        game.toggleFavorite();
                        gameList.filterFavorite();
                      },
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Descrição',
                        style: TextStyle(
                          fontFamily: 'RobotoCondensed',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2.1,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        game.description,
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: 'Raleway',
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    cartList.addItem(game);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('ADICIONAR AO CARRINHO'),
                      Icon(Icons.add_shopping_cart),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
