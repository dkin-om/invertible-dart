import 'addition.dart';
import 'invertible_real_function.dart';

class Subtraction extends InvertibleRealFunction {
  Subtraction(this.subtractBy) : super(Minus(), <dynamic>[subtractBy]);

  final num subtractBy;

  @override
  num call(num x) {
    super.call(x);
    return x - subtractBy;
  }

  @override
  InvertibleRealFunction inverse() => Addition(subtractBy);
}

class Minus extends IRFSymbol<Subtraction> {
  factory Minus() => symbol;

  Minus._internal() : super(<String>['-']);

  static final Minus symbol = Minus._internal();
}
