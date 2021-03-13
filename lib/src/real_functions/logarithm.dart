import 'dart:math';

import 'exponential.dart';
import 'invertible_real_function.dart';

/// Represents logarithm function, f(x) = log<sub>c</sub>(x)
class Logarithm extends InvertibleRealFunction {
  /// Constructs a logarithm function
  const Logarithm([this.base = e]) : super(Log._symbol);

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
    return <bool Function(num)>[(num x) => x > 0];
  }

  @override
  List<Object> get props => <Object>[base];

  @override
  num valueAt(num x) => log(x) / log(base);

  @override
  Exponential inverse() => Exponential(base);
}

///
class Log extends IRFSymbol<Logarithm> {
  ///
  factory Log() => _symbol;

  const Log._internal() : super(const <String>['log']);

  @override
  Logarithm createFunction(List<String> props) =>
      props.isNotEmpty ? Logarithm(num.parse(props[0])) : Logarithm();

  static const Log _symbol = Log._internal();
}
