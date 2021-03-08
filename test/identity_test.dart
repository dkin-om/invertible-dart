import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  initInvertible();

  group('Identity<String>', () {
    test('function returns the argument', () {
      final Identity<String> f = Identity<String>();
      expect(f('dkin-om'), equals('dkin-om'));
    });

    test('inverse function returns the argument', () {
      final Identity<String> f = Identity<String>();
      final Identity<String> finv = f.inverse();
      expect(finv('dkinom'), equals('dkinom'));
    });

    test('.toString() returns empty string', () {
      final Identity<String> f = Identity<String>();
      expect(f.toString(), equals(''));
    });
  });

  group('Identity<num>', () {
    test('function returns the argument', () {
      final Identity<num> f = Identity<num>();
      expect(f(3888), equals(3888));
    });

    test('inverse function returns the argument', () {
      final Identity<num> f = Identity<num>();
      final Identity<num> finv = f.inverse();
      expect(finv(3999.89), equals(3999.89));
    });

    test('.toString() returns empty string', () {
      final Identity<num> f = Identity<num>();
      expect(f.toString(), equals(''));
    });

    test('InvertibleRealFunction.parse()', () {
      final InvertibleRealFunction f = InvertibleRealFunction.parse('');
      expect(f(38888), equals(38888));
    });
  });
}
