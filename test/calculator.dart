import 'package:flutter_test/flutter_test.dart';

void main() {
  group('String Calculator Tests', () {
    test('Returns 0 for no input', () {
      expect(add(""), equals(0));
    });

    test('Returns the number', () {
      expect(add("1"), equals(1));
    });

    test('Returns sum of two numbers', () {
      expect(add("1,2"), equals(3));
    });

    test('Handles unknown number', () {
      expect(add("1,2,3,4,5"), equals(15));
    });
  });
}

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  } else {
    if (numbers.length > 1) {
      List<String> numberList = numbers.split(',');
      int sum = numberList.map((n) => int.parse(n)).fold(0, (a, b) => a + b);
      return sum;
    } else {
      return int.parse(numbers);
    }
  }
}
