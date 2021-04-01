import '../domain_error.dart';

import 'invertible_real_function.dart';
import 'multiplication.dart';

/// Represents division function, f(x) = <sup>x</sup>&frasl;<sub>c</sub>
class Division extends InvertibleRealFunction {
  /// Constructs a division function
  const Division(this.divideBy) : super(Divide._symbol);

  /// Divides the argument
  final num divideBy;

  @override
  List<bool Function(num)> get domain {
    if (divideBy == 0) {
      throw DomainNotDefinedError.value(
          divideBy, 'divideBy', 'Must not be zero');
    }
    return super.domain;
  }

  @override
  List<Object> get props => <Object>[divideBy];

  @override
  num valueAt(num x) => x / divideBy;

  @override
  Multiplication inverse() => Multiplication(divideBy);
}

///
class Divide extends IRFSymbol<Division> {
  ///
  factory Divide() => _symbol;

  const Divide._internal() : super(const <String>['/']);

  @override
  Division createFunction(List<String> props) => Division(num.parse(props[0]));

  static const Divide _symbol = Divide._internal();
}
