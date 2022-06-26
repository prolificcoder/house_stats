import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/main.dart';

main() {
  testWidgets('Integration testing house dashboard', (tester) async {
    await tester.pumpWidget(const HouseStatsApp());
    await tester.pumpAndSettle();

    expect(find.text('Adagio'), findsOneWidget);
    await tester.tap(find.text('Adagio'));
    await tester.tap(find.text('250'));
    await tester.pumpAndSettle();

    expect(find.text('House details'), findsOneWidget);
  });
}
