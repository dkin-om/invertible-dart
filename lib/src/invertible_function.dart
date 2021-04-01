import 'domain_error.dart';
import 'invertible_composite_function.dart';

/// Superclass of all invertible functions
abstract class InvertibleFunction<X, Y> {
  /// Default no-arg constructor
  const InvertibleFunction();

  /// Domain of this function
  List<bool Function(X)> get domain => <bool Function(X)>[(X x) => true];

  /// Returns `true` if [x] is in the [domain] of this function
  bool isInDomain(X x) => domain.any((bool Function(X) s) => s(x));

  /// Makes this class callable
  Y call(X x) {
    if (!isInDomain(x)) {
      throw NotInDomainError.value(x, 'x');
    }
    return valueAt(x);
  }

  /// Defines the behaviour of this function
  ///
  /// This shouldn't be called directly, use [call] instead
  Y valueAt(X x);

  /// Returns composite function of this function and [g]
  ///
  /// Composite function applies [g] then this function
  InvertibleFunction<W, Y> of<W>(InvertibleFunction<W, X> g) =>
      InvertibleCompositeFunction<W, X, Y>(this, g);

  /// Returns composite function of this function and [g]
  ///
  /// Composite function applies [g] then this function
  InvertibleFunction<W, Y> after<W>(InvertibleFunction<W, X> g) => of(g);

  /// Returns composite function of [g] and this function
  ///
  /// Composite function applies this function then [g]
  InvertibleFunction<X, Z> before<Z>(InvertibleFunction<Y, Z> g) => g.of(this);

  /// Returns the inverse function of this function
  InvertibleFunction<Y, X> inverse();
}
