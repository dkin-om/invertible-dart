import 'invertible_composite_function.dart';

/// Superclass of all invertible functions
abstract class InvertibleFunction<X, Y> {
  /// Default no-arg constructor
  InvertibleFunction();

  /// Domain of this function
  final List<bool Function(X)> domain = <bool Function(X)>[];

  /// Returns `true` if [x] is in the [domain] of this function
  bool isInDomain(X x) =>
      domain.isEmpty || domain.any((bool Function(X) s) => s(x));

  /// Defines the behaviour of this function
  ///
  /// Every subclass must override this method and
  /// `super.call(x);` before defining the behaviour
  Y call(X x) {
    if (!isInDomain(x)) {
      throw ArgumentError.value(x, 'x', 'Must be in domain');
    }
    return null;
  }

  /// Returns composite function of this function and [g]
  ///
  /// Composite function applies [g] then this function
  InvertibleFunction<W, Y> of<W>(InvertibleFunction<W, X> g) =>
      InvertibleCompositeFunction<W, X, Y>(this, g);

  /// Returns composite function of this function and [g]
  ///
  /// Composite function applies [g] then this function
  InvertibleFunction<W, Y> after<W>(InvertibleFunction<W, X> g) => of(g);

  /// Shorthand for [after]
  // ignore: always_specify_types
  InvertibleFunction operator <<(InvertibleFunction g) => after(g);

  /// Returns composite function of [g] and this function
  ///
  /// Composite function applies this function then [g]
  InvertibleFunction<X, Z> before<Z>(InvertibleFunction<Y, Z> g) =>
      g?.of(this) ?? this;

  /// Shorthand for [before]
  // ignore: always_specify_types
  InvertibleFunction operator >>(InvertibleFunction g) => before(g);

  /// Returns the inverse function of this function
  InvertibleFunction<Y, X> inverse();
}
