import 'division.dart';
import 'invertible_real_function.dart';

/// Represents multiplication function, f(x) = cx
class Multiplication extends InvertibleRealFunction {
  /// Constructs a multiplication function
  Multiplication(this.multiplyBy) : super(_Multiply(), <dynamic>[multiplyBy]) {
    if (multiplyBy == 0) {
      throw ArgumentError.value(multiplyBy, 'multiplyBy', 'Must not be zero');
    }
  }

  /// Multiplies the argument
  final num multiplyBy;

  @override
  num call(num x) {
    super.call(x);
    return x * multiplyBy;
  }

  @override
  InvertibleRealFunction inverse() => Division(multiplyBy);

  /// Initialize this library
  static void init() {
    _Multiply();
  }
}

class _Multiply extends IRFSymbol<Multiplication> {
  factory _Multiply() => symbol;

  _Multiply._internal() : super(<String>['*', 'x']);

  @override
  Multiplication createFunction(List<String> variables) =>
      Multiplication(num.parse(variables[0]));

  static final _Multiply symbol = _Multiply._internal();
}
