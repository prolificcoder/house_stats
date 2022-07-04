import 'package:flutter_test/flutter_test.dart';
import 'package:house_stats/main.dart';
import 'package:integration_test/integration_test.dart';

main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
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
