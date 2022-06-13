import 'package:flutter/material.dart';
import 'package:house_stats/utils/async_data.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';

class HouseViewModel extends ChangeNotifier {
  late AsyncData asyncDataStatus;
  List<House> houses = List.empty();

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
}
