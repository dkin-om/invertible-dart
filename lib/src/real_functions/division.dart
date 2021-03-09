import 'invertible_real_function.dart';
import 'multiplication.dart';

/// Represents division function, f(x) = <sup>x</sup>&frasl;<sub>c</sub>
class Division extends InvertibleRealFunction {
  /// Constructs a division function
  Division(this.divideBy) : super(_Divide(), <dynamic>[divideBy]) {
    if (divideBy == 0) {
      throw ArgumentError.value(divideBy, 'divideBy', 'Must not be zero');
    }
  }

  /// Divides the argument
  final num divideBy;

  @override
  num call(num x) {
    super.call(x);
    return x / divideBy;
  }

  @override
  InvertibleRealFunction inverse() => Multiplication(divideBy);

  /// Initialize this library
  static void init() {
    _Divide();
  }
}

class _Divide extends IRFSymbol<Division> {
  factory _Divide() => symbol;

  _Divide._internal() : super(<String>['/']);

  @override
  Division createFunction(List<String> variables) =>
      Division(num.parse(variables[0]));

  static final _Divide symbol = _Divide._internal();
}
