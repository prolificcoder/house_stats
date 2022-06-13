import 'package:flutter/material.dart';
import 'package:house_stats/utils/async_data.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';

class HouseViewModel extends ChangeNotifier {
  late AsyncData asyncDataStatus;
  List<House> houses = List.empty();

  init() {
    fetchAllHouses();
    sortHousesByPosition(houses);
  }

  Future<void> fetchAllHouses() async {
    asyncDataStatus = AsyncData.loading('Fetching houses');
    final repository = HouseRepository();
    try {
      houses = await repository.fetchAllHouses();
      asyncDataStatus = AsyncData.loaded(houses);
    } catch (e) {
      asyncDataStatus = AsyncData.error(e.toString());
    }
    notifyListeners();
  }

  List<House> sortHousesByPosition(List<House> houses) {
    for (var i = 0; i < houses.length; i++) {
      for (var j = 0; j < houses.length; j++) {
        if (houses[i].score! < houses[j].score!) {
          var temp = houses[i];
          houses[i] = houses[j];
          houses[j] = temp;
        }
      }
    }
    for (var i = 0; i < houses.length; i++) {
      houses[i].position = i + 1;
    }
    return houses;
  }
}
