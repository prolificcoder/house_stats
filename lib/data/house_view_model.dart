import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:house_stats/api/house_api.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';
import 'package:house_stats/domain/http_house_repository.dart';
import 'package:http/http.dart' as http;

class HouseViewModel extends ChangeNotifier {
  List<House> houses = List.empty();

  Future<void> fetchAllHouses() async {
    final repository = HouseRepository();
    houses = await repository.fetchAllHouses();
    notifyListeners();
  }
}
