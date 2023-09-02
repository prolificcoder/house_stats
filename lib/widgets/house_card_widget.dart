import 'package:flutter/material.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/main.dart';
import 'package:house_stats/screens/house_details_screen.dart';
import 'package:house_stats/widgets/house_place_widget.dart';
import 'package:house_stats/widgets/house_score_widget.dart';

class HouseCardWidget extends StatelessWidget {
  final House house;
  const HouseCardWidget({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyan,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: (() => Navigator.pushNamed(
              context,
              HouseDetailsScreen.routeName,
              arguments: ScreenArguments(
                house.houseName!,
                house.position ?? 0,
              ),
            )),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              house.houseName!,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            HouseScoreWidget(score: house.score!),
            HousePlaceWidget(place: house.position!),
          ]),
        ),
      ),
    );
  }
}
