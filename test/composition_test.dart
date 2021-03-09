import 'dart:math';

import 'package:invertible/invertible.dart';
import 'package:test/test.dart';

void main() {
  initInvertible();

  group('Temperature', () {
    final InvertibleRealFunction f =
        Addition(32) << Division(5) << Multiplication(9);

    final InvertibleRealFunction finv = f.inverse();

    group('.toString()', () {
      test('Celsius to Fahrenheit', () {
        expect(f.toString(), equals('* 9; / 5; + 32'));
      });

      test('Fahrenheit to Celsius', () {
        expect(finv.toString(), equals('- 32; * 5; / 9'));
      });
    });

    test('40 degrees Celsius == 104 degrees Fahrenheit', () {
      expect(f(40), equals(104));
    });

    test('41 degrees Fahrenheit == 5 degrees Celsius', () {
      expect(finv(41), equals(5));
    });

    test('-40 degrees Celsius == -40 degrees Fahrenheit', () {
      expect(f(-40), equals(-40));
    });
  });

  group('pH Scale', () {
    final InvertibleRealFunction f =
        InvertibleRealFunction.parse('; log 10; * -1;');

    final InvertibleRealFunction finv = f.inverse();

    test('${5e-6} moles of hydrogen ions per litre == pH 5.30103', () {
      expect(f(5e-6), closeTo(5.30103, 5e-9));
    });

    test('pH 8.69897 == ${2e-9} moles of hydrogen ions per litre', () {
      expect(finv(8.69897), closeTo(2e-9, 2e-17));
    });
  });

  group('Standard normal distribution', () {
    final InvertibleRealFunction f =
        InvertibleRealFunction.parse('pow 2; / -2; exp; / ${sqrt(2 * pi)}');

    final InvertibleRealFunction finv = f.inverse();

    test('Maximum point', () {
      expect(f(0), closeTo(0.3989423, 5e-7));
    });

    test('Inflection point', () {
      expect(finv(0.2419707), closeTo(1, 5e-7));
    });
  });

  test('Valid compositions', () {
    expect(InvertibleRealFunction.parse('exp;'), isA<InvertibleRealFunction>());
    expect(InvertibleRealFunction.parse('log;'), isA<InvertibleRealFunction>());
  });

  test('Invalid compositions', () {
    expect(() => InvertibleRealFunction.parse('pow;'), throwsArgumentError);
    expect(() => InvertibleRealFunction.parse('ln;'), throwsArgumentError);
  });
}
