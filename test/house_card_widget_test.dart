import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/widgets/house_card_widget.dart';

main() {
  testWidgets('Verify house card shows correct title and score',
      (tester) async {
    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.rtl,
      child: HouseCardWidget(
          house: House(houseName: 'house', score: 4, position: 3)),
    ));

    final widget = tester.widget<Text>(find.text('place: 3'));

    expect(widget.style?.color, isNot(Colors.red));
    expect(find.text('house'), findsOneWidget);
  });
}
