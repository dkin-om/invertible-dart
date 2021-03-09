import 'addition.dart';
import 'invertible_real_function.dart';

/// Represents subtraction function, f(x) = x - c
class Subtraction extends InvertibleRealFunction {
  /// Constructs a subtraction function
  Subtraction(this.subtractBy) : super(_Minus(), <dynamic>[subtractBy]);

  /// Subtracted from the argument
  final num subtractBy;

  @override
  num call(num x) {
    super.call(x);
    return x - subtractBy;
  }

  @override
  InvertibleRealFunction inverse() => Addition(subtractBy);

  /// Initialize this library
  static void init() {
    _Minus();
  }
}

class _Minus extends IRFSymbol<Subtraction> {
  factory _Minus() => symbol;

  _Minus._internal() : super(<String>['-']);

  @override
  Subtraction createFunction(List<String> variables) =>
      Subtraction(num.parse(variables[0]));

  static final _Minus symbol = _Minus._internal();
}
