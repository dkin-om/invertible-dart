import 'invertible_real_function.dart';
import 'subtraction.dart';

class Addition extends InvertibleRealFunction {
  Addition(this.addBy) : super(Plus(), <dynamic>[addBy]);

  final num addBy;

  @override
  num call(num x) {
    super.call(x);
    return x + addBy;
  }

  @override
  InvertibleRealFunction inverse() => Subtraction(addBy);
}

class Plus extends IRFSymbol<Addition> {
  factory Plus() => symbol;

  Plus._internal() : super(<String>['+']);

  static final Plus symbol = Plus._internal();
}
