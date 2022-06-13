import 'dart:convert';
import 'dart:io';

import 'package:house_stats/data/api/house_api.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';
import 'package:http/http.dart' as http;

class HttpHouseRepository implements HouseRepository {
  HttpHouseRepository({
    required this.api,
    required this.client,
  });
  final HouseAPI api;
  final http.Client client;

  @override
  Future<List<House>> fetchAllHouses() async {
    List<House> houses;
    try {
      final response = await http.get(HouseAPI().getAllHousesRoute);
      dynamic responseJson = parseResponse(response);
      houses = List<House>.from(
          responseJson.map((tagJson) => House.fromMap(tagJson)));
    } on SocketException {
      // ignore: prefer_single_quotes
      throw Exception("No network");
    }
    return houses;
  }

  dynamic parseResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw Exception(response.body.toString());
      case 401:
      case 403:
        throw Exception(response.body.toString());
      case 500:
      default:
        throw Exception(
            'Error occured while communication with server with status code : ${response.statusCode}');
    }
  }
}
