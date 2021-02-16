import 'invertible_real_function.dart';
import 'multiplication.dart';

class Division extends InvertibleRealFunction {
  Division(this.divideBy) : super(Divide(), <dynamic>[divideBy]) {
    if (divideBy == 0) {
      throw ArgumentError.value(divideBy, 'divideBy', 'Must not be zero');
    }
  }

  final num divideBy;

  @override
  num call(num x) {
    super.call(x);
    return x / divideBy;
  }

  @override
  InvertibleRealFunction inverse() => Multiplication(divideBy);
}

class Divide extends IRFSymbol<Division> {
  factory Divide() => symbol;

  Divide._internal() : super(<String>['/']);

  static final Divide symbol = Divide._internal();
}
