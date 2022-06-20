import 'package:flutter/material.dart';

class HouseScoreWidget extends StatelessWidget {
  final int score;
  const HouseScoreWidget({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (score > 250) {
      return Text(
        score.toString(),
        style: Theme.of(context).textTheme.headlineMedium,
      );
    } else {
      return Text(
        score.toString(),
        style: Theme.of(context).textTheme.headlineSmall,
      );
    }
  }
}
