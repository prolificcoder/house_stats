import 'package:house_stats/data/api/house_api.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/http_house_repository.dart';
import 'package:http/http.dart' as http;

abstract class HouseRepository {
  factory HouseRepository() {
    //We can additional repositories as our app expands
    return HttpHouseRepository(api: HouseAPI(), client: http.Client());
  }
  Future<List<House>> fetchAllHouses();
}
