import 'package:house_stats/models/house.dart';

abstract class HouseRepository {
  Future<House> getHouses();
}
