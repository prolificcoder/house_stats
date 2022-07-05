import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/data/house_model.dart';

main() {
  test('Verify sorting of houses', () {
    //Arrange
    final house1 = House(houseName: 'first-house', score: 10);
    final house2 = House(houseName: 'second-house', score: 5);
    final house3 = House(houseName: 'third-house', score: 1);
    List<House> houses = List<House>.from(<House>[house1, house2, house3]);

    //Act
    final sortedHouses = House().sortHousesByPosition(houses);

    //Assert
    assert(sortedHouses[2].houseName == 'first-house' &&
        sortedHouses[2].position == 1);
    assert(sortedHouses[1].houseName == 'second-house' &&
        sortedHouses[1].position == 2);
    assert(sortedHouses[0].houseName == 'third-house',
        sortedHouses[0].position == 3);
  });
  test('Verify sorting of houses with only one house', () {
    //Arrange
    final house1 = House(houseName: 'first-house', score: 10);
    List<House> houses = List<House>.from(<House>[house1]);

    //Act
    final sortedHouses = House().sortHousesByPosition(houses);

    //Assert
    assert(sortedHouses[0].houseName == 'first-house' &&
        sortedHouses[0].position == 1);
  });
  test('Verify sorting of houses with equal scores', () {
    //Arrange
    final house1 = House(houseName: 'first-house', score: 10);
    final house2 = House(houseName: 'second-house', score: 10);
    final house3 = House(houseName: 'third-house', score: 1);
    List<House> houses = List<House>.from(<House>[house1, house2, house3]);

    //Act
    final sortedHouses = House().sortHousesByPosition(houses);

    //Assert
    assert(sortedHouses[2].houseName == 'first-house' &&
        sortedHouses[2].position == 1);
    assert(sortedHouses[1].houseName == 'second-house' &&
        sortedHouses[1].position == 2);
    assert(sortedHouses[0].houseName == 'third-house',
        sortedHouses[0].position == 3);
  });
}
