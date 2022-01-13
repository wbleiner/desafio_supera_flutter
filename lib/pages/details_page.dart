import 'package:desafio_supera_flutter/models/game_item.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameItem game =
        ModalRoute.of(context)!.settings.arguments as GameItem;
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
      ),
      body: Container(
        child: Hero(
          tag: game.id,
          child: Image.asset(
            'assets/images/items/${game.image}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
