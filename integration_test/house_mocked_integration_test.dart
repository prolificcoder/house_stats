import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/data/house_model.dart';
import 'package:house_stats/domain/house_repository.dart';
import 'package:house_stats/main.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

main() {
  testWidgets('Integration testing house dashboard', (tester) async {
    await tester.pumpWidget(const HouseStatsApp());
    await tester.pumpAndSettle();

    expect(find.text('1house'), findsOneWidget);
    expect(find.text('10'), findsOneWidget);
    await tester.tap(find.text('1house'));
    await tester.pumpAndSettle();

    expect(find.text('House details'), findsOneWidget);
    expect(find.text('1house'), findsOneWidget);
  });
}
