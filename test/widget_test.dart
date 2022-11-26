import 'package:flutter_test/flutter_test.dart';
import 'package:security_data/ui/widgets/labs/lab5/lab5_model.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    expect(Lab5Model().intToBytes(10), [1, 0, 1, 0]);
    expect(Lab5Model().intToBytes(56), [1, 1, 1, 0, 0, 0]);
    expect(Lab5Model().modPow(2, 3, 4), 0);
    expect(Lab5Model().modPow(5, 3, 16), 13);
    // expect(Lab5Model().modPow(7, 560, 561), 1);
    expect(Lab5Model().testMillerRabin(2, 10), true);
    expect(Lab5Model().testMillerRabin(5, 10), true);
    expect(Lab5Model().testMillerRabin(12, 10), false);
    expect(Lab5Model().testMillerRabin(13, 10), true);
    expect(Lab5Model().testMillerRabin(255, 10), false);
    expect(Lab5Model().testMillerRabin(3462, 10), false);
    expect(Lab5Model().testMillerRabin(431613451, 100), true);
  });
}
