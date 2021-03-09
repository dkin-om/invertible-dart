import 'dart:math';

import 'invertible_real_function.dart';

/// Represents power function, f(x) = x<sup>c</sup>
class Power extends InvertibleRealFunction {
  /// Constructs a power function
  Power(this.exponent) : super(_Pow(), <dynamic>[exponent]) {
    if (exponent == 0) {
      throw ArgumentError.value(exponent, 'exponent', 'Must not be zero');
    }
    if (exponent % 2 == 1 || (1 / exponent) % 2 == 1) {
      domain.add((num x) => exponent > 0 || x != 0);
    } else {
      domain.add((num x) => x >= 0 && (exponent > 0 || x != 0));
    }
  }

  /// Power to which the argument is raised to
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

  /// Initialize this library
  static void init() {
    _Pow();
  }
}

class _Pow extends IRFSymbol<Power> {
  factory _Pow() => symbol;

  _Pow._internal() : super(<String>['^', '**', 'pow']);

  @override
  Power createFunction(List<String> variables) =>
      Power(num.parse(variables[0]));

  static final _Pow symbol = _Pow._internal();
}
