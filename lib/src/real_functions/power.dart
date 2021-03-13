import 'dart:math';

import 'invertible_real_function.dart';

/// Represents power function, f(x) = x<sup>c</sup>
class Power extends InvertibleRealFunction {
  /// Constructs a power function
  const Power(this.exponent) : super(Pow._symbol);

  /// Power to which the argument is raised to
  final num exponent;

  @override
  List<bool Function(num)> get domain {
    if (exponent == 0) {
      throw ArgumentError.value(exponent, 'exponent', 'Must not be zero');
    }
    if (exponent % 2 == 1 || (1 / exponent) % 2 == 1) {
      return <bool Function(num)>[(num x) => exponent > 0 || x != 0];
    } else {
      return <bool Function(num)>[
        (num x) => x >= 0 && (exponent > 0 || x != 0)
      ];
    }
  }

  @override
  List<Object> get props => <Object>[exponent];

  @override
  num valueAt(num x) => x < 0 ? -pow(-x, exponent) : pow(x, exponent);

  @override
  Power inverse() => Power(1 / exponent);
}

///
class Pow extends IRFSymbol<Power> {
  ///
  factory Pow() => _symbol;

  const Pow._internal() : super(const <String>['^', '**', 'pow']);

  @override
  Power createFunction(List<String> props) => Power(num.parse(props[0]));

  static const Pow _symbol = Pow._internal();
}
