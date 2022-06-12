import 'package:flutter/material.dart';

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
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: const <Widget>[
            Card(child: Text('Dragons')),
            Card(child: Text('Unicorns')),
            Card(child: Text('Wizards')),
            Card(child: Text('Divas')),
          ],
        ),
      ),
    );
  }
}
