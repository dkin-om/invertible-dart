import 'package:equatable/equatable.dart';

import '../identity.dart';
import '../invertible_function.dart';

import 'addition.dart';
import 'division.dart';
import 'exponential.dart';
import 'logarithm.dart';
import 'multiplication.dart';
import 'power.dart';
import 'subtraction.dart';

/// Superclass of all invertible real functions
abstract class InvertibleRealFunction extends InvertibleFunction<num, num>
    with EquatableMixin {
  /// Constructs a real function
  const InvertibleRealFunction([this._symbol]);

  /// Converts any invertible function whose domain ⊆ [num] and codomain ⊆ [num]
  /// into an instance of `InvertibleRealFunction`
  factory InvertibleRealFunction.of(InvertibleFunction<num, num> irf) =>
      irf is InvertibleRealFunction ? irf : _InvertibleRealFunctionImpl(irf);

  /// Parse [source] as an instance of `InvertibleRealFunction` and return
  factory InvertibleRealFunction.parse(String source) {
    source = source.trim();
    final List<String> parts = source.split(';');

    InvertibleRealFunction irf = Identity<num>().toIRF();

    for (String part in parts) {
      part = part.trim();

      final List<String> f =
          part.split(' ').where((String s) => s.isNotEmpty).toList();
      if (f.isEmpty) continue;

      final IRFSymbol<dynamic> symbol = IRFSymbol._of(f[0]);
      final List<String> props = f.sublist(1);

      irf >>= symbol.createFunction(props);
    }

    return InvertibleRealFunction.of(irf);
  }

  final IRFSymbol<dynamic>? _symbol;

  /// Shorthand for [after]
  InvertibleRealFunction operator <<(InvertibleFunction<num, num> g) =>
      InvertibleRealFunction.of(after(g));

  /// Shorthand for [before]
  InvertibleRealFunction operator >>(InvertibleFunction<num, num> g) =>
      InvertibleRealFunction.of(before(g));

  @override
  InvertibleRealFunction inverse();

  @override
  String toString() => '${_symbol?._tokens[0] ?? ''} ${props.join(' ')}'.trim();
}

class _InvertibleRealFunctionImpl extends InvertibleRealFunction {
  _InvertibleRealFunctionImpl(this.irf);

  final InvertibleFunction<num, num> irf;

  @override
  List<Object> get props => <Object>[irf];

  @override
  num valueAt(num x) => irf(x);

  @override
  _InvertibleRealFunctionImpl inverse() =>
      _InvertibleRealFunctionImpl(irf.inverse());

  @override
  String toString() => '$irf';
}

///
extension ToIRF on InvertibleFunction<num, num> {
  /// Converts into an instance of [InvertibleRealFunction]
  InvertibleRealFunction toIRF() => InvertibleRealFunction.of(this);
}

///
extension ComposeListOfIRF on List<InvertibleFunction<num, num>> {
  /// Returns the composite [InvertibleRealFunction] of
  /// this [List] of [InvertibleFunction<num, num>]
  InvertibleRealFunction compose() {
    InvertibleRealFunction irf = Identity<num>().toIRF();
    for (final InvertibleFunction<num, num> f in this) {
      irf >>= f.toIRF();
    }
    return irf;
  }

  /// Returns the inverse composite [InvertibleRealFunction] of
  /// this [List] of [InvertibleFunction<num, num>]
  InvertibleRealFunction inverse() => compose().inverse();
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
  const IRFSymbol(this._tokens);

  final List<String> _tokens;

  /// Creates an instance of [F]
  F createFunction(List<String> props);

  @override
  String toString() => '$_tokens';

  static final List<IRFSymbol<dynamic>> _all = <IRFSymbol<dynamic>>[
    Plus(),
    Minus(),
    Multiply(),
    Divide(),
    Pow(),
    Exp(),
    Log(),
  ];

  /// Register a `IRFSymbol`
  ///
  /// Registering makes it parsable with [InvertibleRealFunction.parse]
  static void register(IRFSymbol<dynamic> symbol) => _all.add(symbol);

  static IRFSymbol<dynamic> _of(String token) => _all.singleWhere(
        (IRFSymbol<dynamic> symbol) => symbol._tokens.contains(token),
      );
}
