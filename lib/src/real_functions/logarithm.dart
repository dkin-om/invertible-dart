import 'dart:math';

import 'exponential.dart';
import 'invertible_real_function.dart';

/// Represents logarithm function, f(x) = log<sub>c</sub>(x)
class Logarithm extends InvertibleRealFunction {
  /// Constructs a logarithm function
  Logarithm([this.base = e]) : super(_Log(), <dynamic>[base]) {
    if (base <= 0) {
      throw ArgumentError.value(base, 'base', 'Must be positive');
    }
    if (base == 1) {
      throw ArgumentError.value(base, 'base', 'Must not be one');
    }
    domain.add((num x) => x > 0);
  }

  /// Base of this function
  final num base;

  @override
  num call(num x) {
    super.call(x);
    return log(x) / log(base);
  }

  @override
  InvertibleRealFunction inverse() => Exponential(base);

  /// Initialize this library
  static void init() {
    _Log();
  }
}

class _Log extends IRFSymbol<Logarithm> {
  factory _Log() => symbol;

  _Log._internal() : super(<String>['log']);

  static final _Log symbol = _Log._internal();
}
