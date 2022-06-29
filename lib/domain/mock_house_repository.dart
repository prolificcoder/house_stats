import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';
import 'package:mockito/mockito.dart';

class MockHouseRepository extends Mock implements HouseRepository {
  @override
  Future<List<House>> fetchAllHouses() {
    final house1 = House(houseName: '1house', score: 10);
    final house2 = House(houseName: '2house', score: 5);
    final house3 = House(houseName: '3house', score: 1);
    final house4 = House(houseName: '4house', score: 3);
    List<House> houses =
        List<House>.from(<House>[house1, house2, house3, house4]);

    return Future.value(houses);
  }
}
