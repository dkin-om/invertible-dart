import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  group('Division', () {
    group('function divides the argument by a given number', () {
      test('divideBy > 0', () {
        final Division f = Division(5);
        expect(f(8), equals(1.6));
      });

      test('divideBy == 0', () {
        final Division f = Division(0);
        expect(() => f(8), throwsA(TypeMatcher<DomainNotDefinedError>()));
      });

      test('divideBy < 0', () {
        final Division f = Division(-2.5);
        expect(f(8), equals(-3.2));
      });
    });

    group('inverse function multiplies the argument with a given number', () {
      test('divideBy > 0', () {
        final Division f = Division(5);
        final Multiplication finv = f.inverse();
        expect(finv(8), equals(40));
      });

      test('divideBy < 0', () {
        final Division f = Division(-2.5);
        final Multiplication finv = f.inverse();
        expect(finv(8), equals(-20));
      });
    });

    group('.toString()', () {
      test('divideBy > 0', () {
        final Division f = Division(5);
        expect(f.toString(), equals('/ 5'));
      });

      test('divideBy < 0', () {
        final Division f = Division(-2.5);
        expect(f.toString(), equals('/ -2.5'));
      });
    });

    group('InvertibleRealFunction.parse()', () {
      test('divideBy > 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('/ 5');
        expect(f(8), equals(1.6));
      });

      test('divideBy < 0', () {
        final InvertibleRealFunction f = InvertibleRealFunction.parse('/ -2.5');
        expect(f(8), equals(-3.2));
      });
    });
  });
}
