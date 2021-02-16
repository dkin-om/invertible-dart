import 'invertible_function.dart';

class InvertibleCompositeFunction<X, Y, Z> extends InvertibleFunction<X, Z> {
  InvertibleCompositeFunction(this.f, this.g);

  final InvertibleFunction<Y, Z> f;
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
  String toString() => '$g $f'.trim();
}
