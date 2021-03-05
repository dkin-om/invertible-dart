import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  group('Addition', () {
    group('function adds a given number to the argument', () {
      test('addBy > 0', () {
        final Addition f = Addition(2.5);
        expect(f(8), equals(10.5));
      });

      test('addBy == 0', () {
        final Addition f = Addition(0);
        expect(f(8), equals(8));
      });

      test('addBy < 0', () {
        final Addition f = Addition(-5);
        expect(f(8), equals(3));
      });
    });

    group('inverse function subtracts a given number from the argument', () {
      test('addBy > 0', () {
        final Addition f = Addition(2.5);
        final Subtraction finv = f.inverse();
        expect(finv(8), equals(5.5));
      });

      test('addBy == 0', () {
        final Addition f = Addition(0);
        final Subtraction finv = f.inverse();
        expect(finv(8), equals(8));
      });

      test('addBy < 0', () {
        final Addition f = Addition(-5);
        final Subtraction finv = f.inverse();
        expect(finv(8), equals(13));
      });
    });

    group('.toString()', () {
      test('addBy > 0', () {
        final Addition f = Addition(2.5);
        expect(f.toString(), equals('+ 2.5'));
      });

      test('addBy == 0', () {
        final Addition f = Addition(0);
        expect(f.toString(), equals('+ 0'));
      });

      test('addBy < 0', () {
        final Addition f = Addition(-5);
        expect(f.toString(), equals('+ -5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('addBy > 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('+ 2.5');
        expect(f(8), equals(10.5));
      });

      test('addBy == 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('+ 0');
        expect(f(8), equals(8));
      });

      test('addBy < 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('+ -5');
        expect(f(8), equals(3));
      });
    });
  });
}
