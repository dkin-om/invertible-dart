import 'dart:math';

import 'invertible_real_function.dart';
import 'logarithm.dart';

/// Represents exponential function, f(x) = c<sup>x</sup>
class Exponential extends InvertibleRealFunction {
  /// Constructs an exponential function
  const Exponential([this.base = e]) : super(Exp._symbol);

  /// Base of this function
  final num base;

  @override
  List<bool Function(num)> get domain {
    if (base <= 0) {
      throw ArgumentError.value(base, 'base', 'Must be positive');
    }
    if (base == 1) {
      throw ArgumentError.value(base, 'base', 'Must not be one');
    }
    return super.domain;
  }

  @override
  List<Object> get props => <Object>[base];

  @override
  num valueAt(num x) => pow(base, x);

  @override
  Logarithm inverse() => Logarithm(base);
}

///
class Exp extends IRFSymbol<Exponential> {
  ///
  factory Exp() => _symbol;

  const Exp._internal() : super(const <String>['exp']);

  @override
  Exponential createFunction(List<String> props) =>
      props.isNotEmpty ? Exponential(num.parse(props[0])) : Exponential();

  static const Exp _symbol = Exp._internal();
}
