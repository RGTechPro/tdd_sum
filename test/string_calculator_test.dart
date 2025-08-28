import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_sum/domain/services/string_calculator.dart';

void main() {
  group('String Calculator', () {
    late StringCalculator calculator;

    setUp(() {
      calculator = StringCalculator();
    });

    test('should return 0 for empty string', () {
      expect(calculator.add(''), equals(0));
    });

    test('should return the number for single number string', () {
      expect(calculator.add('1'), equals(1));
      expect(calculator.add('5'), equals(5));
    });

    test('should return sum of two comma-separated numbers', () {
      expect(calculator.add('1,5'), equals(6));
      expect(calculator.add('2,3'), equals(5));
    });

    test('should handle any amount of numbers', () {
      expect(calculator.add('1,2,3'), equals(6));
      expect(calculator.add('1,2,3,4,5'), equals(15));
    });

    test('should handle newlines between numbers instead of commas', () {
      expect(calculator.add('1\n2,3'), equals(6));
      expect(calculator.add('1\n2\n3'), equals(6));
    });

    test('should support different delimiters', () {
      expect(calculator.add('//;\n1;2'), equals(3));
      expect(calculator.add('//|\n1|2|3'), equals(6));
    });

    test('should throw exception for negative numbers', () {
      expect(() => calculator.add('-1'), throwsException);
      expect(() => calculator.add('1,-2'), throwsException);
    });

    test('should show negative numbers in exception message', () {
      expect(
        () => calculator.add('-1'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -1'))),
      );
      
      expect(
        () => calculator.add('1,-2,-3'),
        throwsA(predicate((e) => e.toString().contains('negative numbers not allowed -2,-3'))),
      );
    });

    test('should ignore numbers bigger than 1000', () {
      expect(calculator.add('2,1001'), equals(2));
      expect(calculator.add('1000,1001,2'), equals(1002));
      expect(calculator.add('999,1000,1001'), equals(1999));
    });

    test('should support delimiters of any length', () {
      expect(calculator.add('//[***]\n1***2***3'), equals(6));
      expect(calculator.add('//[;;]\n4;;5;;6'), equals(15));
      expect(calculator.add('//[abc]\n10abc20abc30'), equals(60));
    });

    test('should support multiple delimiters', () {
      expect(calculator.add('//[*][%]\n1*2%3'), equals(6));
      expect(calculator.add('//[;][|]\n4;5|6'), equals(15));
    });

    test('should support multiple delimiters with length longer than one char', () {
      expect(calculator.add('//[**][%%]\n1**2%%3'), equals(6));
      expect(calculator.add('//[abc][def]\n10abc20def30'), equals(60));
    });
  });
}
