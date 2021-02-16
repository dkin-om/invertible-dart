import 'invertible_function.dart';

class Identity<X> extends InvertibleFunction<X, X> {
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
