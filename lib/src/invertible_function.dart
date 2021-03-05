import 'invertible_composite_function.dart';

abstract class InvertibleFunction<X, Y> {
  InvertibleFunction();

  final List<bool Function(X)> domain = <bool Function(X)>[];

  bool isInDomain(X x) =>
      domain.isEmpty || domain.any((bool Function(X) s) => s(x));

  Y call(X x) {
    if (!isInDomain(x)) {
      throw ArgumentError.value(x, 'x', 'Must be in domain');
    }
    return null;
  }

  InvertibleFunction<W, Y> _of<W>(InvertibleFunction<W, X> g) =>
      InvertibleCompositeFunction<W, X, Y>(this, g);

  InvertibleFunction<W, Y> after<W>(InvertibleFunction<W, X> g) => _of(g);

  // ignore: always_specify_types
  InvertibleFunction operator <<(InvertibleFunction g) => after(g);

  InvertibleFunction<X, Z> before<Z>(InvertibleFunction<Y, Z> g) =>
      g?.after(this) ?? this;

  // ignore: always_specify_types
  InvertibleFunction operator >>(InvertibleFunction g) => before(g);

  InvertibleFunction<Y, X> inverse();
}
