import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  group('Logarithm', () {
    group('function takes logarithm of the argument to the base a given number',
        () {
      group('base < 0', () {
        test('x > 0', () {
          final Logarithm f = Logarithm(-1.23);
          expect(() => f(0.00390625),
              throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x == 0', () {
          final Logarithm f = Logarithm(-1.23);
          expect(() => f(0), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x < 0', () {
          final Logarithm f = Logarithm(-1.23);
          expect(() => f(-1.5), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });
      });

      group('base == 0', () {
        test('x > 0', () {
          final Logarithm f = Logarithm(0);
          expect(() => f(0.00390625),
              throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x == 0', () {
          final Logarithm f = Logarithm(0);
          expect(() => f(0), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x < 0', () {
          final Logarithm f = Logarithm(0);
          expect(() => f(-1.5), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });
      });

      group('base > 0 && base < 1', () {
        test('x > 0', () {
          final Logarithm f = Logarithm(0.5);
          expect(f(0.00390625), equals(8));
        });

        test('x == 0', () {
          final Logarithm f = Logarithm(0.5);
          expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
        });

        test('x < 0', () {
          final Logarithm f = Logarithm(0.5);
          expect(() => f(-1.5), throwsA(TypeMatcher<NotInDomainError>()));
        });
      });

      group('base == 1', () {
        test('x > 0', () {
          final Logarithm f = Logarithm(1);
          expect(() => f(0.00390625),
              throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x == 0', () {
          final Logarithm f = Logarithm(1);
          expect(() => f(0), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x < 0', () {
          final Logarithm f = Logarithm(1);
          expect(() => f(-1.5), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });
      });

      group('base > 1', () {
        test('x > 0', () {
          final Logarithm f = Logarithm(5);
          expect(f(545915033.5692846), equals(12.5));
        });

        test('x == 0', () {
          final Logarithm f = Logarithm(5);
          expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
        });

        test('x < 0', () {
          final Logarithm f = Logarithm(5);
          expect(() => f(-1.5), throwsA(TypeMatcher<NotInDomainError>()));
        });
      });
    });

    group('inverse function raises a given number to the power of the argument',
        () {
      test('base > 0 && base < 1', () {
        final Logarithm f = Logarithm(0.5);
        final Exponential finv = f.inverse();
        expect(finv(8), equals(0.00390625));
      });

      test('base > 1', () {
        final Logarithm f = Logarithm(5);
        final Exponential finv = f.inverse();
        expect(finv(12.5), equals(545915033.5692846));
      });
    });

    group('.toString()', () {
      test('base > 0 && base < 1', () {
        final Logarithm f = Logarithm(0.5);
        expect(f.toString(), equals('log 0.5'));
      });

      test('base > 1', () {
        final Logarithm f = Logarithm(5);
        expect(f.toString(), equals('log 5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('base > 0 && base < 1', () {
        final InvertibleRealFunction f =
            InvertibleRealFunction.parse('log 0.5');
        expect(f(0.00390625), equals(8));
      });

      test('base > 1', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('log 5');
        expect(f(545915033.5692846), equals(12.5));
      });
    });
  });
}
