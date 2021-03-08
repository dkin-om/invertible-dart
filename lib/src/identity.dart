import 'invertible_function.dart';

/// Represents identity function, f(x) = x
class Identity<X> extends InvertibleFunction<X, X> {
  /// Constructs an identity function
  Identity();

  @override
  X call(X x) {
    super.call(x);
    return x;
  }

  @override
  InvertibleFunction<X, X> inverse() => Identity<X>();

  @override
  String toString() => '';
}
