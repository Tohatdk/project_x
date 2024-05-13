import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:project_x/src/features/profile_feature/presentation/bloc/bloc_args.dart';
import 'package:project_x/src/features/profile_feature/presentation/ui/pages/profile_edit_page.dart';

Future<void> main() async {
  testGoldens('DeviceBuilder - one scenario - defakult devices',
      (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: ProfileEditPage(
          args: ProfileBlocsCommunicationsArgs(email: ''),
        ),
        name: 'ProfileEditScreen',
      );

    await tester.pumpDeviceBuilder(builder);
    builder.build();

    await screenMatchesGolden(tester, 'flutter_profile_page_single_scenario');
  });

  testGoldens('DeviceBuilder - multiple scenarios', (tester) async {
    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(
        devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ],
      )
      ..addScenario(
        widget: ProfileEditPage(
          args: ProfileBlocsCommunicationsArgs(email: ''),
        ),
        name: 'default profile edit page',
      );

    await tester.pumpDeviceBuilder(builder);
    builder.build();

    await screenMatchesGolden(
      tester,
      'flutter_profile_edit_page_multiple_scenarios',
    );
  });
}
