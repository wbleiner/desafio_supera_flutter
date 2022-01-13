import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({Key? key, required this.score}) : super(key: key);

  List<Icon> _counterStars(int score) {
    List<Icon> iconsStars = [];
    const int maxStars = 5;
    for (var i = 0; i < maxStars; i++) {
      score -= 100;

      if (score > -50) {
        iconsStars.add(Icon(Icons.star));
      } else if (score <= -50 && score > -100) {
        iconsStars.add(Icon(Icons.star_half));
      } else {
        iconsStars.add(Icon(Icons.star_border));
      }
    }
    return iconsStars;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _counterStars(score),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
