import 'package:house_stats/data/house.dart';
import 'package:house_stats/domain/repository/house_repository.dart';
import 'package:http/http.dart' as http;

class HttpHouseRepository implements HouseRepository {
  HttpHouseRepository({
    required this.api,
    required this.client,
  });
  final HouseAPI api;
  final http.Client client;

  @override
  Future<House> getHouses() {}
}
