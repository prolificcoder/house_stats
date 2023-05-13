// ignore_for_file: invalid_use_of_internal_member,
// depend_on_referenced_packages, directives_ordering

import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol/src/native/contracts/contracts.pbgrpc.dart';
import 'package:test_api/src/backend/invoker.dart';

// START: GENERATED CODE
import 'house_mocked_integration_test.dart' as house_mocked_integration_test;
import 'house_mocked_integration2_test.dart' as house_mocked_integration2_test;
// END: GENERATED CODE

Future<void> main() async {
  // TODO: Create and use PatrolNativeTestService instead of NativeAutomator
  final nativeAutomator = NativeAutomator(config: NativeAutomatorConfig());
  final binding = PatrolBinding.ensureInitialized();
  // Create a PatrolAppService.
  //
  // When running on Android, the Android Test Orchestrator, before running the
  // tests, makes an initial run to gather the tests that it will later run. The
  // native side of Patrol (specifically: PatrolJUnitRunner class) is hooked
  // into the Android Test Orchestrator lifecycle and knows when that initial
  // run happens. When it does, PatrolJUnitRunner makes an RPC call to
  // PatrolAppService and asks it for the list of Dart tests.
  //
  // When running on iOS, the native side of Patrol (specifically: the
  // PATROL_INTEGRATION_TEST_IOS_RUNNER macro) makes an RPC call to
  // PatrolAppSevice and asks it for the list of Dart tests.
  //
  // Once the native runner have the list of Dart tests, it dynamically creates
  // native test method from them. On Android, this is done using Parametrized
  // JUnit runner. On iOS, new test case methods are swizzled taking advantage
  // of the very dynamic nature of Objective-C runtime.
  //
  // These Dart tests are later called by the single JUnit test that is
  // parametrized with the gathered Dart tests.

  final testExplorationCompleter = Completer<DartTestGroup>();

  // A special test to expore the hierarchy of groups and tests. This test must
  // be the first to run. If not, the native side won't any tests.
  // See also: https://github.com/dart-lang/test/issues/1998
  test('patrol_test_explorer', () {
    final topLevelGroup = Invoker.current!.liveTest.groups.first;
    final dartTestGroup = createDartTestGroup(topLevelGroup);
    testExplorationCompleter.complete(dartTestGroup);
  });

  // START: GENERATED CODE
  group('house_mocked_integration_test', house_mocked_integration_test.main);
  group('house_mocked_integration2_test', house_mocked_integration2_test.main);
  // END: GENERATED CODE

  final dartTestGroup = await testExplorationCompleter.future;
  final appService = PatrolAppService(topLevelDartTestGroup: dartTestGroup);
  binding.patrolAppService = appService;
  await runAppService(appService);

  // Until now, the native test runner was waiting for us, the Dart side, to
  // come alive. Now that we did, let's tell it that we're ready to be asked
  // about Dart tests.
  await nativeAutomator.markPatrolAppServiceReady();

  await appService.testExecutionCompleted;
}
