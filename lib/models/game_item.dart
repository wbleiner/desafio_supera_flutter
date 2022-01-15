import 'package:flutter/material.dart';

class GameItem with ChangeNotifier {
  final int id;
  final String name;
  final double price;
  final int score;
  final String image;
  bool isFavorite;

  GameItem({
    required this.id,
    required this.name,
    required this.price,
    required this.score,
    required this.image,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
