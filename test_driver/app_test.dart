import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Weather Service', () {
    late final FlutterDriver driver;

    final userInput = find.byValueKey("user_input");
    final passwordInput = find.byValueKey("password_input");
    final buttonLogin = find.byValueKey('button_login');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Login Success', () async {
      await driver.tap(userInput);
      await driver.enterText("user");
      await driver.tap(passwordInput);
      await driver.enterText("123456");

      await driver.tap(buttonLogin);
      await driver.waitFor(find.text('Cartoon'));

      expect(await driver.getText(find.text('Cartoon')), 'Cartoon');
    });
  });
}
