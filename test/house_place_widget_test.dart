import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/widgets/house_place_widget.dart';

main() {
  testWidgets('Verify house place card shows red for 1 place', (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.rtl,
      child: HousePlaceWidget(place: 1),
    ));

    final widget = tester.widget<Text>(find.text('place: 1'));

    expect(widget.style?.color, Colors.red);
  });
  testWidgets('Verify house place card not shows red for 2 place',
      (tester) async {
    await tester.pumpWidget(const Directionality(
      textDirection: TextDirection.rtl,
      child: HousePlaceWidget(place: 2),
    ));

    final widget = tester.widget<Text>(find.text('place: 2'));

    expect(widget.style?.color, isNot(Colors.red));
  });
}
