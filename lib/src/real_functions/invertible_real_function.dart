import '../identity.dart';
import '../invertible_function.dart';

/// Superclass of all invertible real functions
abstract class InvertibleRealFunction extends InvertibleFunction<num, num> {
  /// Constructs a real function
  InvertibleRealFunction([this._symbol, this._variables]);

  /// Converts any invertible function whose domain ⊆ [num] and codomain ⊆ [num]
  /// into an instance of `InvertibleRealFunction`
  factory InvertibleRealFunction.of(InvertibleFunction<num, num> irf) =>
      _InvertibleRealFunctionImpl(irf);

  /// Parse [source] as an instance of `InvertibleRealFunction` and return
  factory InvertibleRealFunction.parse(String source) {
    source = source.trim();
    final List<String> parts = source.split(';');

    InvertibleFunction<num, num> irf = Identity<num>();

    for (String part in parts) {
      part = part.trim();

      final List<String> f =
          part.split(' ').where((String s) => s.isNotEmpty).toList();
      if (f.isEmpty) continue;

      final IRFSymbol<dynamic> symbol = IRFSymbol._of(f[0]);
      final List<String> variables = f.sublist(1);

      if (symbol == null) {
        throw ArgumentError.value(source, 'source', 'Invalid source');
      }

      irf >>= symbol.createFunction(variables);
    }

    return InvertibleRealFunction.of(irf);
  }

  final IRFSymbol<dynamic> _symbol;

  final List<dynamic> _variables;

  @override
  InvertibleFunction<W, num> of<W>(InvertibleFunction<W, num> g) {
    if (g is InvertibleFunction<num, num>) {
      final InvertibleFunction<num, num> composed =
          super.of(g as InvertibleFunction<num, num>);
      return InvertibleRealFunction.of(composed) as InvertibleFunction<W, num>;
    } else {
      return super.of(g);
    }
  }

  @override
  String toString() => '${_symbol._tokens[0]} ${_variables.join(' ')}';
}

class _InvertibleRealFunctionImpl extends InvertibleRealFunction {
  _InvertibleRealFunctionImpl(this.irf);

  final InvertibleFunction<num, num> irf;

  @override
  num call(num x) {
    super.call(x);
    return irf(x);
  }

  @override
  InvertibleRealFunction inverse() =>
      _InvertibleRealFunctionImpl(irf.inverse());

  @override
  String toString() => '$irf';
}

/// Represents operator(s) of [F]
///
/// Used during serialization and deserialization of [F]
///
/// See [InvertibleRealFunction.toString] and [InvertibleRealFunction.parse] for more
abstract class IRFSymbol<F extends InvertibleRealFunction> {
  /// Constructs a symbol for [F]
  ///
  /// [_tokens] is [List] of possible operators
  IRFSymbol(this._tokens) {
    final Iterable<String> invalidTokens =
        _tokens.where((String t) => t.contains(' '));
    if (invalidTokens.isNotEmpty) {
      throw ArgumentError.value(
          _tokens, '_tokens', 'Invalid tokens $invalidTokens');
    }

    _all.add(this);
  }

  final List<String> _tokens;

  /// Creates an instance of [F]
  F createFunction(List<String> variables);

  @override
  String toString() => '$_tokens';

  static final List<IRFSymbol<dynamic>> _all = <IRFSymbol<dynamic>>[];

  static IRFSymbol<dynamic> _of(String token) => _all.singleWhere(
      (IRFSymbol<dynamic> symbol) => symbol._tokens.contains(token),
      orElse: () => null);
}
