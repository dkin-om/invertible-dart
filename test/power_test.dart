import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  group('Power', () {
    group('function raises the argument to the power of a given number', () {
      group('exponent == 0', () {
        test('x > 0', () {
          final Power f = Power(0);
          expect(() => f(4), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x == 0', () {
          final Power f = Power(0);
          expect(() => f(0), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });

        test('x < 0', () {
          final Power f = Power(0);
          expect(
              () => f(-3.1415), throwsA(TypeMatcher<DomainNotDefinedError>()));
        });
      });

      group('exponent % 2 == 1', () {
        group('exponent > 0', () {
          test('x > 0', () {
            final Power f = Power(3);
            expect(f(4), equals(64));
          });

          test('x == 0', () {
            final Power f = Power(3);
            expect(f(0), equals(0));
          });

          test('x < 0', () {
            final Power f = Power(3);
            expect(f(-3.1415), closeTo(-31.003533, 2e-6));
          });
        });

        group('exponent < 0', () {
          test('x > 0', () {
            final Power f = Power(-5);
            expect(f(2), equals(0.03125));
          });

          test('x == 0', () {
            final Power f = Power(-5);
            expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
          });

          test('x < 0', () {
            final Power f = Power(-5);
            expect(f(-0.271828), closeTo(-673.796966, 2e-6));
          });
        });
      });

      group('(1 / exponent) % 2 == 1', () {
        group('exponent > 0', () {
          test('x > 0', () {
            final Power f = Power(1 / 7);
            expect(f(16384), closeTo(4, 1e-15));
          });

          test('x == 0', () {
            final Power f = Power(1 / 7);
            expect(f(0), equals(0));
          });

          test('x < 0', () {
            final Power f = Power(1 / 7);
            expect(f(-3019.6697), closeTo(-3.1415, 2e-6));
          });
        });

        group('exponent < 0', () {
          test('x > 0', () {
            final Power f = Power(-1 / 9);
            expect(f(512), equals(0.5));
          });

          test('x == 0', () {
            final Power f = Power(-1 / 9);
            expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
          });

          test('x < 0', () {
            final Power f = Power(-1 / 9);
            expect(f(-0.000008103034873), closeTo(-3.678796, 2e-6));
          });
        });
      });

      group('exponent % 2 == 0', () {
        group('exponent > 0', () {
          test('x > 0', () {
            final Power f = Power(4);
            expect(f(4), equals(256));
          });

          test('x == 0', () {
            final Power f = Power(4);
            expect(f(0), equals(0));
          });

          test('x < 0', () {
            final Power f = Power(4);
            expect(() => f(-3.1415), throwsA(TypeMatcher<NotInDomainError>()));
          });
        });

        group('exponent < 0', () {
          test('x > 0', () {
            final Power f = Power(-6);
            expect(f(2), equals(0.015625));
          });

          test('x == 0', () {
            final Power f = Power(-6);
            expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
          });

          test('x < 0', () {
            final Power f = Power(-6);
            expect(
                () => f(-0.271828), throwsA(TypeMatcher<NotInDomainError>()));
          });
        });
      });

      group('(1 / exponent) % 2 == 0', () {
        group('exponent > 0', () {
          test('x > 0', () {
            final Power f = Power(1 / 8);
            expect(f(65536), closeTo(4, 1e-15));
          });

          test('x == 0', () {
            final Power f = Power(1 / 8);
            expect(f(0), equals(0));
          });

          test('x < 0', () {
            final Power f = Power(1 / 8);
            expect(
                () => f(-3019.6697), throwsA(TypeMatcher<NotInDomainError>()));
          });
        });

        group('exponent < 0', () {
          test('x > 0', () {
            final Power f = Power(-1 / 10);
            expect(f(1024), equals(0.5));
          });

          test('x == 0', () {
            final Power f = Power(-1 / 10);
            expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
          });

          test('x < 0', () {
            final Power f = Power(-1 / 10);
            expect(() => f(-0.000008103034873),
                throwsA(TypeMatcher<NotInDomainError>()));
          });
        });
      });

      group('exponent % 1 != 0 && (1 / exponent) % 1 != 0', () {
        group('exponent > 0', () {
          test('x > 0', () {
            final Power f = Power(3.5);
            expect(f(4), equals(128));
          });

          test('x == 0', () {
            final Power f = Power(3.5);
            expect(f(0), equals(0));
          });

          test('x < 0', () {
            final Power f = Power(3.5);
            expect(() => f(-3.1415), throwsA(TypeMatcher<NotInDomainError>()));
          });
        });

        group('exponent < 0', () {
          test('x > 0', () {
            final Power f = Power(-5.5);
            expect(f(2), closeTo(0.022097, 2e-6));
          });

          test('x == 0', () {
            final Power f = Power(-5.5);
            expect(() => f(0), throwsA(TypeMatcher<NotInDomainError>()));
          });

          test('x < 0', () {
            final Power f = Power(-5.5);
            expect(
                () => f(-0.271828), throwsA(TypeMatcher<NotInDomainError>()));
          });
        });
      });
    });

    group(
        'inverse function raises the argument to the power of inverse of a given number',
        () {
      test('exponent > 0', () {
        final Power f = Power(2.5);
        final Power finv = f.inverse();
        expect(finv(32), equals(4));
      });

      test('exponent < 0', () {
        final Power f = Power(-4.5);
        final Power finv = f.inverse();
        expect(finv(0.044194), closeTo(2, 2e-6));
      });
    });

    group('.toString()', () {
      test('exponent > 0', () {
        final Power f = Power(2.5);
        expect(f.toString(), equals('^ 2.5'));
      });

      test('exponent < 0', () {
        final Power f = Power(-4.5);
        expect(f.toString(), equals('^ -4.5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('exponent > 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('^ 2.5');
        expect(f(4), equals(32));
      });

      test('exponent < 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('^ -4.5');
        expect(f(2), closeTo(0.044194, 2e-6));
      });
    });
  });
}
