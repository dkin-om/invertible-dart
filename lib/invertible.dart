import 'src/real_functions/addition.dart';
import 'src/real_functions/division.dart';
import 'src/real_functions/exponential.dart';
import 'src/real_functions/logarithm.dart';
import 'src/real_functions/multiplication.dart';
import 'src/real_functions/power.dart';
import 'src/real_functions/subtraction.dart';

export 'src/identity.dart' show Identity;
export 'src/invertible_function.dart' show InvertibleFunction;
export 'src/real_functions/addition.dart' show Addition;
export 'src/real_functions/division.dart' show Division;
export 'src/real_functions/exponential.dart' show Exponential;
export 'src/real_functions/invertible_real_function.dart'
    show InvertibleRealFunction, IRFSymbol;
export 'src/real_functions/logarithm.dart' show Logarithm;
export 'src/real_functions/multiplication.dart' show Multiplication;
export 'src/real_functions/power.dart' show Power;
export 'src/real_functions/subtraction.dart' show Subtraction;

/// Initialize this library
void initInvertible() {
  Addition.init();
  Division.init();
  Exponential.init();
  Logarithm.init();
  Multiplication.init();
  Power.init();
  Subtraction.init();
}
