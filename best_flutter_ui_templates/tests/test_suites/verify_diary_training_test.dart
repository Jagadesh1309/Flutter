import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import '../test_utils/testUtils.dart';

late FlutterDriver driver;
final testUtils = TestUtils(driver);

void main() {
  group('E2E Tests', () {
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test('Verify Diary Page - Training', () async {
      try {
        await testUtils.scrollTo(
          find.byType('GridView'),
          0.0,
          -300.0,
          const Duration(milliseconds: 500),
        );
        await testUtils
            .click(find.byValueKey('assets/fitness_app/fitness_app.png'));

        await testUtils.click(find.byValueKey('assets/fitness_app/tab_2.png'));
        await testUtils.verifyTextExists(
            find.text('Area of focus'), 'Area of focus');

        await testUtils.verifyElementExists(
            find.byValueKey('assets/fitness_app/area1.png'));
        await testUtils.verifyElementExists(
            find.byValueKey('assets/fitness_app/area2.png'));
        await testUtils.verifyElementExists(
            find.byValueKey('assets/fitness_app/area3.png'));

        print('Diary Page Training verified successfully');
      } catch (e) {
        await testUtils.captureScreenshot('Diary_Training_Test');
        rethrow;
      }
    });
  });
}
