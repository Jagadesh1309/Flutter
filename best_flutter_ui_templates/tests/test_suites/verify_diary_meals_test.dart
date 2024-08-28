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

    test('Verify Diary Page - Meals', () async {
      try {
        await testUtils.scrollTo(
          find.byType('GridView'),
          0.0,
          -300.0,
          Duration(milliseconds: 500),
        );
        await testUtils
            .click(find.byValueKey('assets/fitness_app/fitness_app.png'));

        await testUtils.verifyTextExists(
            find.text('Mediterranean diet'), 'Mediterranean diet');
        await testUtils.verifyElementExists(find.text('Body measurement'));
        await testUtils.verifyElementExists(find.text('1127'));
        await testUtils.verifyElementExists(find.text('102'));
        await testUtils.verifyElementExists(find.text('1503'));

        // print('Diary Page Meals verified successfully');
      } catch (e) {
        await testUtils.captureScreenshot('Diary_Meals_Test');
        rethrow;
      }
    });
  });
}
