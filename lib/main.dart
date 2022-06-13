import 'package:flutter/material.dart';
import 'package:house_stats/screens/house_dashboard_screen.dart';

void main() {
  runApp(const HouseStatsApp());
}

class HouseStatsApp extends StatelessWidget {
  const HouseStatsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HouseDashboardScreen(title: 'Houses leaderboard'),
    );
  }
}
