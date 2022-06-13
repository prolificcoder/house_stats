import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:house_stats/api/api_response.dart';
import 'package:house_stats/api/house_api.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';
import 'package:house_stats/domain/http_house_repository.dart';
import 'package:http/http.dart' as http;

class HouseViewModel extends ChangeNotifier {
  ApiResponse apiResponse = ApiResponse.initial('Initial');
  List<House> houses = List.empty();

  Future<void> fetchAllHouses() async {
    apiResponse = ApiResponse.loading('Fetching houses');
    final repository = HouseRepository();
    try {
      houses = await repository.fetchAllHouses();
      apiResponse = ApiResponse.loaded(houses);
    } catch (e) {
      apiResponse = ApiResponse.error(e.toString());
    }
    notifyListeners();
  }
}
