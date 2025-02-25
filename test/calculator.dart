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
    test('Handles \n number', () {
      expect(add("1\n2,3"), equals(6));
    });
    test('Supports custom delimiter ";"', () {
      expect(add("//;\n1;2"), equals(3));
    });
  });
}

int add(String numbers) {
  if (numbers.isEmpty) {
    return 0;
  } else {
    String delimiterPattern = r'[,\n]';
    if (numbers.startsWith('//')) {
      int newlineIndex = numbers.indexOf('\n');
      if (newlineIndex != -1) {
        delimiterPattern = RegExp.escape(numbers.substring(2, newlineIndex));
        numbers = numbers.substring(newlineIndex + 1);
      }
    }
    List<String> numberList = numbers.split(RegExp('$delimiterPattern|,|\n'));
    int sum = numberList.map((n) => int.tryParse(n) ?? 0).fold(0, (a, b) => a + b);
    return sum;
  }
}
