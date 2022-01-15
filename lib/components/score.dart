import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  const Score({Key? key, required this.score}) : super(key: key);

  List<Icon> _counterStars() {
    List<Icon> iconsStars = [];
    const int maxStars = 5;
    int sc = score;
    for (var i = 0; i < maxStars; i++) {
      sc -= 100;

      if (sc > -50) {
        iconsStars.add(Icon(Icons.star));
      } else if (sc <= -50 && sc > -100) {
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
      children: _counterStars(),
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }
}
