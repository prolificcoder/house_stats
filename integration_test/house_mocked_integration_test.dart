import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/main.dart';
import 'package:patrol/patrol.dart';

main() {
  patrolTest('Integration testing house dashboard', (tester) async {
    await tester.pumpWidget(const HouseStatsApp());
    await tester.pumpAndSettle();

    expect(find.text('1house'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    await tester.tap(find.text('1house'));
    await tester.pumpAndSettle();

    expect(find.text('House details'), findsOneWidget);
    expect(find.text('1house'), findsOneWidget);
  });
   patrolTest(
    'counter state is the same after going to home and switching apps',
    nativeAutomation: true,
    ($) async {
      await $.pumpWidgetAndSettle(
       const HouseStatsApp(),
      );

    // expect(find.text('1house'), findsOneWidget);
    // expect(find.text('10'), findsOneWidget);
    // await tester.tap(find.text('1house'));
    // await tester.pumpAndSettle();

    // expect(find.text('House details'), findsOneWidget);
    // expect(find.text('1house'), findsOneWidget);
    },
  );
}
