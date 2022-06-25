import 'package:flutter/material.dart';
import 'package:house_stats/main.dart';
import 'package:house_stats/screens/house_details_screen.dart';
import 'package:house_stats/utils/async_data.dart';
import 'package:house_stats/data/house_view_model.dart';
import 'package:house_stats/widgets/house_card_widget.dart';
import 'package:provider/provider.dart';

class HouseDashboardScreen extends StatefulWidget {
  const HouseDashboardScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HouseDashboardScreen> createState() => _HouseLeaderboardState();
}

class _HouseLeaderboardState extends State<HouseDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ChangeNotifierProvider(
          create: (_) => HouseViewModel()..fetchAllHouses(),
          child: Consumer<HouseViewModel>(
            builder: (context, model, child) {
              switch (model.asyncDataStatus.status) {
                case Status.loading:
                  return const CircularProgressIndicator();
                case Status.error:
                  return ErrorWidget(model.asyncDataStatus.data);
                case Status.loaded:
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 3 / 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: model.houses.length,
                      itemBuilder: (_, index) {
                        return HouseCardWidget(house: model.houses[index]);
                      },
                    ),
                  );
              }
            },
          ),
        ));
  }
}
