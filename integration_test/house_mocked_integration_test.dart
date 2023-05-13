import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/main.dart';
import 'package:patrol/patrol.dart';

main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    ($) async {
      await $.pumpWidgetAndSettle(
        const HouseStatsApp(),
      );

      expect($('1house'), findsOneWidget);
      expect($('10'), findsOneWidget);
      await $('1house').tap();

      expect($('House details'), findsOneWidget);
      expect($('1house'), findsOneWidget);
    },
    nativeAutomation: true,
  );
}
