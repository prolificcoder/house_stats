import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/data/house_view_model.dart';
import 'package:house_stats/utils/async_data.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'house_view_model_test.mocks.dart';

@GenerateMocks([HouseViewModel, AsyncData])
main() {
  test('Testing view model loaded state', () {
    //Arrange
    var houseViewModel = MockHouseViewModel();
    var house = House(houseName: 'first', score: 23);
    when(houseViewModel.fetchAllHouses()).thenAnswer((_) => Future.value());
    when(houseViewModel.asyncDataStatus)
        .thenAnswer((_) => AsyncData.loaded(house));

    //Assert
    houseViewModel.fetchAllHouses();

    //Act
    verify(houseViewModel.fetchAllHouses()).called(1);
    assert(houseViewModel.asyncDataStatus.toString() ==
        AsyncData.loaded(house).toString());
  });
}
