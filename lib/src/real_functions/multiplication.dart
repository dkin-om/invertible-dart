import '../domain_error.dart';

import 'division.dart';
import 'invertible_real_function.dart';

/// Represents multiplication function, f(x) = cx
class Multiplication extends InvertibleRealFunction {
  /// Constructs a multiplication function
  const Multiplication(this.multiplyBy) : super(Multiply._symbol);

  /// Multiplies the argument
  final num multiplyBy;

  @override
  List<bool Function(num)> get domain {
    if (multiplyBy == 0) {
      throw DomainNotDefinedError.value(
          multiplyBy, 'multiplyBy', 'Must not be zero');
    }
    return super.domain;
  }

  @override
  List<Object> get props => <Object>[multiplyBy];

  @override
  num valueAt(num x) => x * multiplyBy;

  @override
  Division inverse() => Division(multiplyBy);
}

///
class Multiply extends IRFSymbol<Multiplication> {
  ///
  factory Multiply() => _symbol;

  const Multiply._internal() : super(const <String>['*', 'x']);

  @override
  Multiplication createFunction(List<String> props) =>
      Multiplication(num.parse(props[0]));

  static const Multiply _symbol = Multiply._internal();
}
