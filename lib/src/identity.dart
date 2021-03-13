import 'invertible_function.dart';

/// Represents identity function, f(x) = x
class Identity<X> extends InvertibleFunction<X, X> {
  /// Constructs an identity function
  Identity();

  @override
  X valueAt(X x) => x;

  @override
  Identity<X> inverse() => Identity<X>();

  @override
  String toString() => '';
}
