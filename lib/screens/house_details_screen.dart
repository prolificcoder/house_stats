import 'package:flutter/material.dart';

class HouseDetailsScreen extends StatelessWidget {
  static const routeName = '/house-details';
  const HouseDetailsScreen({
    Key? key,
    required this.title,
    required this.position,
  }) : super(key: key);
  final String title;
  final int position;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'House details',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'House name: $title',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                'House place: $position',
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ));
  }
}
