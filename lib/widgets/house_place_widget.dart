import 'package:flutter/material.dart';

class HousePlaceWidget extends StatelessWidget {
  final int place;
  const HousePlaceWidget({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (place == 1) {
      return Text(
        'place: $place',
        style:
            Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red),
      );
    } else {
      return Text(
        'place: $place',
        style: Theme.of(context).textTheme.bodyText1,
      );
    }
  }
}
