import 'invertible_function.dart';

/// Composes two functions f and g and produces a function h such that h(x) = f(g(x))
class InvertibleCompositeFunction<X, Y, Z> extends InvertibleFunction<X, Z> {
  /// Constructs a composite function
  InvertibleCompositeFunction(this.f, this.g);

  /// Function f
  final InvertibleFunction<Y, Z> f;

  /// Function g
  final InvertibleFunction<X, Y> g;

  @override
  Z call(X x) {
    super.call(x);
    return f(g(x));
  }

  @override
  InvertibleFunction<Z, X> inverse() =>
      InvertibleCompositeFunction<Z, Y, X>(g.inverse(), f.inverse());

  @override
  String toString() => '$g; $f'.trim();
}
