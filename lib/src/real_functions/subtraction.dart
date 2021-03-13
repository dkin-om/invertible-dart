import 'addition.dart';
import 'invertible_real_function.dart';

/// Represents subtraction function, f(x) = x - c
class Subtraction extends InvertibleRealFunction {
  /// Constructs a subtraction function
  const Subtraction(this.subtractBy) : super(Minus._symbol);

  /// Subtracted from the argument
  final num subtractBy;

  @override
  List<Object> get props => <Object>[subtractBy];

  @override
  num valueAt(num x) => x - subtractBy;

  @override
  Addition inverse() => Addition(subtractBy);
}

///
class Minus extends IRFSymbol<Subtraction> {
  ///
  factory Minus() => _symbol;

  const Minus._internal() : super(const <String>['-']);

  @override
  Subtraction createFunction(List<String> props) =>
      Subtraction(num.parse(props[0]));

  static const Minus _symbol = Minus._internal();
}
