import 'division.dart';
import 'invertible_real_function.dart';

class Multiplication extends InvertibleRealFunction {
  Multiplication(this.multiplyBy) : super(Multiply(), <dynamic>[multiplyBy]) {
    if (multiplyBy == 0) {
      throw ArgumentError.value(multiplyBy, 'multiplyBy', 'Must not be zero');
    }
  }

  final num multiplyBy;

  @override
  num call(num x) {
    super.call(x);
    return x * multiplyBy;
  }

  @override
  InvertibleRealFunction inverse() => Division(multiplyBy);
}

class Multiply extends IRFSymbol<Multiplication> {
  factory Multiply() => symbol;

  Multiply._internal() : super(<String>['*', 'x']);

  static final Multiply symbol = Multiply._internal();
}
