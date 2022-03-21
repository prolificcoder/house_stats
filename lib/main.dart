import 'package:flutter/material.dart';

void main() {
  runApp(const HouseStatsApp());
}

class HouseStatsApp extends StatelessWidget {
  const HouseStatsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'House leaderboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HouseLeaderboard(
          title: 'Cascade conservatory house leaderboard'),
    );
  }
}

class HouseLeaderboard extends StatefulWidget {
  const HouseLeaderboard({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HouseLeaderboard> createState() => _HouseLeaderboardState();
}

class _HouseLeaderboardState extends State<HouseLeaderboard> {
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
