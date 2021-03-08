import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  initInvertible();

  group('Subtraction', () {
    group('function subtracts a given number from the argument', () {
      test('subtractBy > 0', () {
        final Subtraction f = Subtraction(5);
        expect(f(8), equals(3));
      });

      test('subtractBy == 0', () {
        final Subtraction f = Subtraction(0);
        expect(f(8), equals(8));
      });

      test('subtractBy < 0', () {
        final Subtraction f = Subtraction(-2.5);
        expect(f(8), equals(10.5));
      });
    });

    group('inverse function adds a given number to the argument', () {
      test('subtractBy > 0', () {
        final Subtraction f = Subtraction(5);
        final Addition finv = f.inverse();
        expect(finv(8), equals(13));
      });

      test('subtractBy == 0', () {
        final Subtraction f = Subtraction(0);
        final Addition finv = f.inverse();
        expect(finv(8), equals(8));
      });

      test('subtractBy < 0', () {
        final Subtraction f = Subtraction(-2.5);
        final Addition finv = f.inverse();
        expect(finv(8), equals(5.5));
      });
    });

    group('.toString()', () {
      test('subtractBy > 0', () {
        final Subtraction f = Subtraction(5);
        expect(f.toString(), equals('- 5'));
      });

      test('subtractBy == 0', () {
        final Subtraction f = Subtraction(0);
        expect(f.toString(), equals('- 0'));
      });

      test('subtractBy < 0', () {
        final Subtraction f = Subtraction(-2.5);
        expect(f.toString(), equals('- -2.5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('subtractBy > 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('- 5');
        expect(f(8), equals(3));
      });

      test('subtractBy == 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('- 0');
        expect(f(8), equals(8));
      });

      test('subtractBy < 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('- -2.5');
        expect(f(8), equals(10.5));
      });
    });
  });
}
