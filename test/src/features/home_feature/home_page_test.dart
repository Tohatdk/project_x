import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:project_x/src/features/home_feature/home_page.dart';


Future<void> main()async{
  testGoldens('DeviceBuilder - one scenario - default devices', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: const HomePage(),
        name: 'HomeScreen',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'flutter_demo_page_single_scenario');
  });

  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
          (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ],)
          ..addScenario(
            widget: const HomePage(),
            name: 'default home page',
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(tester, 'flutter_home_page_multiple_scenarios');
      });
}