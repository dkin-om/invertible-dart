import 'dart:math';

import 'exponential.dart';
import 'invertible_real_function.dart';

class Logarithm extends InvertibleRealFunction {
  Logarithm([this.base = e]) : super(Log(), <dynamic>[base]) {
    if (base <= 0) {
      throw ArgumentError.value(base, 'base', 'Must be positive');
    }
    if (base == 1) {
      throw ArgumentError.value(base, 'base', 'Must not be one');
    }
    domain.add((num x) => x > 0);
  }

  final num base;

  @override
  num call(num x) {
    super.call(x);
    return log(x) / log(base);
  }

  @override
  InvertibleRealFunction inverse() => Exponential(base);
}

class Log extends IRFSymbol<Logarithm> {
  factory Log() => symbol;

  Log._internal() : super(<String>['log']);

  static final Log symbol = Log._internal();
}
