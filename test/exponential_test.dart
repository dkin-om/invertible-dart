import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  group('Exponential', () {
    group('function raises a given number to the power of the argument', () {
      group('base < 0', () {
        test('x > 0', () {
          final Exponential f = Exponential(-1.23);
          expect(() => f(3), throwsArgumentError);
        });

        test('x == 0', () {
          final Exponential f = Exponential(-1.23);
          expect(() => f(0), throwsArgumentError);
        });

        test('x < 0', () {
          final Exponential f = Exponential(-1.23);
          expect(() => f(-1.5), throwsArgumentError);
        });
      });

      group('base == 0', () {
        test('x > 0', () {
          final Exponential f = Exponential(0);
          expect(() => f(3), throwsArgumentError);
        });

        test('x == 0', () {
          final Exponential f = Exponential(0);
          expect(() => f(0), throwsArgumentError);
        });

        test('x < 0', () {
          final Exponential f = Exponential(0);
          expect(() => f(-1.5), throwsArgumentError);
        });
      });

      group('base > 0 && base < 1', () {
        test('x > 0', () {
          final Exponential f = Exponential(0.25);
          expect(f(3), equals(0.015625));
        });

        test('x == 0', () {
          final Exponential f = Exponential(0.25);
          expect(f(0), equals(1));
        });

        test('x < 0', () {
          final Exponential f = Exponential(0.25);
          expect(f(-1.5), equals(8));
        });
      });

      group('base == 1', () {
        test('x > 0', () {
          final Exponential f = Exponential(1);
          expect(() => f(3), throwsArgumentError);
        });

        test('x == 0', () {
          final Exponential f = Exponential(1);
          expect(() => f(0), throwsArgumentError);
        });

        test('x < 0', () {
          final Exponential f = Exponential(1);
          expect(() => f(-1.5), throwsArgumentError);
        });
      });

      group('base > 1', () {
        test('x > 0', () {
          final Exponential f = Exponential(2.5);
          expect(f(3), equals(15.625));
        });

        test('x == 0', () {
          final Exponential f = Exponential(2.5);
          expect(f(0), equals(1));
        });

        test('x < 0', () {
          final Exponential f = Exponential(2.5);
          expect(f(-1.5), closeTo(0.252982, 2e-6));
        });
      });
    });

    group(
        'inverse function takes logarithm of the argument to the base a given number',
        () {
      test('base > 0 && base < 1', () {
        final Exponential f = Exponential(0.25);
        final Logarithm finv = f.inverse();
        expect(finv(0.015625), equals(3));
      });

      test('base > 1', () {
        final Exponential f = Exponential(2.5);
        final Logarithm finv = f.inverse();
        expect(finv(15.625), equals(3));
      });
    });

    group('.toString()', () {
      test('base > 0 && base < 1', () {
        final Exponential f = Exponential(0.25);
        expect(f.toString(), equals('exp 0.25'));
      });

      test('base > 1', () {
        final Exponential f = Exponential(2.5);
        expect(f.toString(), equals('exp 2.5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('base > 0 && base < 1', () {
        final InvertibleRealFunction f =
            InvertibleRealFunction.parse('exp 0.25');
        expect(f(3), equals(0.015625));
      });

      test('base > 1', () {
        final InvertibleRealFunction f =
            InvertibleRealFunction.parse('exp 2.5');
        expect(f(3), equals(15.625));
      });
    });
  });
}
