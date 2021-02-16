import 'dart:math';

import 'invertible_real_function.dart';
import 'logarithm.dart';

class Exponential extends InvertibleRealFunction {
  Exponential([this.base = e]) : super(Exp(), <dynamic>[base]) {
    if (base <= 0) {
      throw ArgumentError.value(base, 'base', 'Must be positive');
    }
    if (base == 1) {
      throw ArgumentError.value(base, 'base', 'Must not be one');
    }
  }

  final num base;

  @override
  num call(num x) {
    super.call(x);
    return pow(base, x);
  }

  @override
  InvertibleRealFunction inverse() => Logarithm(base);
}

class Exp extends IRFSymbol<Exponential> {
  factory Exp() => symbol;

  Exp._internal() : super(<String>['exp']);

  static final Exp symbol = Exp._internal();
}
