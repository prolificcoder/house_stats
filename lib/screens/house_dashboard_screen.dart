import 'package:flutter/material.dart';
import 'package:house_stats/api/api_response.dart';
import 'package:house_stats/data/house_view_model.dart';
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
              return _updateHouseScreen(context, model);
            },
          ),
        ));
  }
}

Widget _updateHouseScreen(BuildContext context, HouseViewModel model) {
  switch (model.apiResponse.status) {
    case Status.loading:
    case Status.initial:
      return const CircularProgressIndicator();
    case Status.error:
      return ErrorWidget(model.apiResponse.data);
    case Status.loaded:
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemCount: model.houses.length,
        itemBuilder: (_, index) {
          return Container(
            alignment: Alignment.center,
            child: Text(model.houses[index].houseName!),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(15)),
          );
        },
      );
  }
}
