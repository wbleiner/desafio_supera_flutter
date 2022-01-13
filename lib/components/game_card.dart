import 'package:desafio_supera_flutter/components/score.dart';
import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:desafio_supera_flutter/utils/app_routes.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final GameItem gameLoaded;
  const GameCard({
    Key? key,
    required this.gameLoaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              arguments: gameLoaded,
            ),
            child: Column(
              children: [
                Container(
                  child: Hero(
                    tag: gameLoaded.id,
                    child: Image.asset(
                      'assets/images/items/${gameLoaded.image}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  child: Text(
                    gameLoaded.name,
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
          Score(score: gameLoaded.score),
          Row(
            children: [
              Text(
                'R\$ ${gameLoaded.price.toStringAsFixed(2).replaceAll('.', ',')}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 18,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
        ],
      ),
    );
  }
}
