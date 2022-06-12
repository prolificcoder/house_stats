import 'package:flutter/material.dart';
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
  return const CircularProgressIndicator();
}
