import 'package:desafio_supera_flutter/utils/score_types.dart';
import 'package:flutter/material.dart';

class Score extends StatelessWidget {
  final int score;
  final ScoreTypes scoreType;
  const Score({
    Key? key,
    required this.score,
    required this.scoreType,
  }) : super(key: key);

  Widget _counterStars() {
    List<Widget> iconsStars = [];
    const int maxStars = 5;
    int sc = score;
    for (var i = 0; i < maxStars; i++) {
      sc -= 100;

      if (sc > -50) {
        iconsStars.add(Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ));
      } else if (sc <= -50 && sc > -100) {
        iconsStars.add(
          Icon(
            Icons.star_half,
            color: Colors.yellow,
            size: 20,
          ),
        );
      } else {
        iconsStars.add(
          Icon(
            Icons.star,
            color: Colors.grey.shade300,
            size: 20,
          ),
        );
      }
    }
    return Row(
      children: iconsStars,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  @override
  Widget build(BuildContext context) {
    return scoreType == ScoreTypes.TOTAL
        ? Row(
            children: [
              _counterStars(),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          )
        : Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 20,
              ),
              Text(
                (score / 100).toStringAsFixed(1),
              ),
            ],
          );
  }
}
