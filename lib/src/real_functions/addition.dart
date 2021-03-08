import 'invertible_real_function.dart';
import 'subtraction.dart';

/// Represents addition function, f(x) = x + c
class Addition extends InvertibleRealFunction {
  /// Constructs an addition function
  Addition(this.addBy) : super(_Plus(), <dynamic>[addBy]);

  /// Added to the argument
  final num addBy;

  @override
  num call(num x) {
    super.call(x);
    return x + addBy;
  }

  @override
  InvertibleRealFunction inverse() => Subtraction(addBy);

  /// Initialize this library
  static void init() {
    _Plus();
  }
}

class _Plus extends IRFSymbol<Addition> {
  factory _Plus() => symbol;

  _Plus._internal() : super(<String>['+']);

  static final _Plus symbol = _Plus._internal();
}
