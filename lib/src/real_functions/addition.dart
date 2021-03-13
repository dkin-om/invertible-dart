import 'invertible_real_function.dart';
import 'subtraction.dart';

/// Represents addition function, f(x) = x + c
class Addition extends InvertibleRealFunction {
  /// Constructs an addition function
  const Addition(this.addBy) : super(Plus._symbol);

  /// Added to the argument
  final num addBy;

  @override
  List<Object> get props => <Object>[addBy];

  @override
  num valueAt(num x) => x + addBy;

  @override
  Subtraction inverse() => Subtraction(addBy);
}

///
class Plus extends IRFSymbol<Addition> {
  ///
  factory Plus() => _symbol;

  const Plus._internal() : super(const <String>['+']);

  @override
  Addition createFunction(List<String> props) => Addition(num.parse(props[0]));

  static const Plus _symbol = Plus._internal();
}
