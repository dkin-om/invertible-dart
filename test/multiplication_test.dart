import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  initInvertible();

  group('Multiplication', () {
    group('function multiplies the argument with a given number', () {
      test('multiplyBy > 0', () {
        final Multiplication f = Multiplication(2.5);
        expect(f(8), equals(20));
      });

      test('multiplyBy == 0', () {
        expect(() => Multiplication(0), throwsArgumentError);
      });

      test('multiplyBy < 0', () {
        final Multiplication f = Multiplication(-5);
        expect(f(8), equals(-40));
      });
    });

    group('inverse function divides the argument by a given number', () {
      test('multiplyBy > 0', () {
        final Multiplication f = Multiplication(2.5);
        final Division finv = f.inverse();
        expect(finv(8), equals(3.2));
      });

      test('multiplyBy < 0', () {
        final Multiplication f = Multiplication(-5);
        final Division finv = f.inverse();
        expect(finv(8), equals(-1.6));
      });
    });

    group('.toString()', () {
      test('multiplyBy > 0', () {
        final Multiplication f = Multiplication(2.5);
        expect(f.toString(), equals('* 2.5'));
      });

      test('multiplyBy < 0', () {
        final Multiplication f = Multiplication(-5);
        expect(f.toString(), equals('* -5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('multiplyBy > 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('* 2.5');
        expect(f(8), equals(20));
      });

      test('multiplyBy < 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('* -5');
        expect(f(8), equals(-40));
      });
    });
  });
}
