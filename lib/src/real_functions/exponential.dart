import 'dart:math';

import 'invertible_real_function.dart';
import 'logarithm.dart';

/// Represents exponential function, f(x) = c<sup>x</sup>
class Exponential extends InvertibleRealFunction {
  /// Constructs an exponential function
  Exponential([this.base = e]) : super(_Exp(), <dynamic>[base]) {
    if (base <= 0) {
      throw ArgumentError.value(base, 'base', 'Must be positive');
    }
    if (base == 1) {
      throw ArgumentError.value(base, 'base', 'Must not be one');
    }
  }

  /// Base of this function
  final num base;

  @override
  num call(num x) {
    super.call(x);
    return pow(base, x);
  }

  @override
  InvertibleRealFunction inverse() => Logarithm(base);

  /// Initialize this library
  static void init() {
    _Exp();
  }
}

class _Exp extends IRFSymbol<Exponential> {
  factory _Exp() => symbol;

  _Exp._internal() : super(<String>['exp']);

  @override
  Exponential createFunction(List<String> variables) => variables.isNotEmpty
      ? Exponential(num.parse(variables[0]))
      : Exponential();

  static final _Exp symbol = _Exp._internal();
}
