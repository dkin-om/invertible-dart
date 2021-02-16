import 'dart:math';

import 'invertible_real_function.dart';

class Power extends InvertibleRealFunction {
  Power(this.exponent) : super(Pow(), <dynamic>[exponent]) {
    if (exponent == 0) {
      throw ArgumentError.value(exponent, 'exponent', 'Must not be zero');
    }
    if (exponent % 2 == 1 || (1 / exponent) % 2 == 1) {
      domain.add((num x) => exponent > 0 || x != 0);
    } else {
      domain.add((num x) => x >= 0 && (exponent > 0 || x != 0));
    }
  }

  final num exponent;

  @override
  num call(num x) {
    super.call(x);
    if (x < 0) {
      return -pow(-x, exponent);
    } else {
      return pow(x, exponent);
    }
  }

  @override
  InvertibleRealFunction inverse() => Power(1 / exponent);
}

class Pow extends IRFSymbol<Power> {
  factory Pow() => symbol;

  Pow._internal() : super(<String>['^', '**', 'pow']);

  static final Pow symbol = Pow._internal();
}
