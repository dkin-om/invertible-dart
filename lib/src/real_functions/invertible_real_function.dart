import 'dart:mirrors';

import '../identity.dart';
import '../invertible_function.dart';

import 'addition.dart';
import 'division.dart';
import 'exponential.dart';
import 'logarithm.dart';
import 'multiplication.dart';
import 'power.dart';
import 'subtraction.dart';

abstract class InvertibleRealFunction extends InvertibleFunction<num, num> {
  InvertibleRealFunction([this._symbol, this._variables]);

  factory InvertibleRealFunction.of(InvertibleFunction<num, num> irf) =>
      _InvertibleRealFunctionImpl(irf);

  factory InvertibleRealFunction.parse(String source) {
    source = source.trim();

    InvertibleFunction<num, num> irf = Identity<num>();

    IRFSymbol<dynamic> _symbol;
    List<String> _variables;
    for (final String token in source.split(' ')) {
      final IRFSymbol<dynamic> symbol = IRFSymbol.of(token);
      if (symbol != null) {
        irf >>= _symbol?.createFunction(_variables);

        _symbol = symbol;
        _variables = <String>[];
      } else {
        if (_variables == null) {
          if (source.isNotEmpty) {
            throw ArgumentError.value(source, 'source', 'Invalid source');
          }
        } else {
          _variables.add(token);
        }
      }
    }
    irf >>= _symbol?.createFunction(_variables);

    return InvertibleRealFunction.of(irf);
  }

  final IRFSymbol<dynamic> _symbol;

  final List<dynamic> _variables;

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

abstract class IRFSymbol<F extends InvertibleRealFunction> {
  IRFSymbol(this._tokens) {
    final Iterable<String> invalidTokens =
        _tokens.where((String t) => t.contains(' '));
    if (invalidTokens.isNotEmpty) {
      throw ArgumentError.value(
          _tokens, '_tokens', 'Invalid tokens $invalidTokens');
    }
  }

  final List<String> _tokens;

  F createFunction(List<String> variables) {
    final ClassMirror classMirror = (reflectType(F) as ClassMirror);
    final InstanceMirror instanceMirror = classMirror.newInstance(
        Symbol(''), List<num>.of(variables.map(num.parse)));
    return instanceMirror.reflectee;
  }

  @override
  String toString() => '$_tokens';

  static final List<IRFSymbol<dynamic>> all = <IRFSymbol<dynamic>>[
    Plus(),
    Minus(),
    Multiply(),
    Divide(),
    Pow(),
    Exp(),
    Log()
  ];

  static IRFSymbol<dynamic> of(String token) => all.singleWhere(
      (IRFSymbol<dynamic> symbol) => symbol._tokens.contains(token),
      orElse: () => null);
}
