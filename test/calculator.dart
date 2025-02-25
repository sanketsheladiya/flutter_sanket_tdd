import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Calculator Tests', () {
    test('Returns 0 for no input', () {
      expect(add(""), equals(0));
    });

    test('Returns the number', () {
      expect(add("1"), equals(1));
    });
  });
}

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  } else {
    return int.parse(numbers);
  }
}
