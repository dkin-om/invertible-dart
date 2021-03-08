import 'package:invertible/invertible.dart';

void main() {
  initInvertible();

  temperature();
  pHscale();
}

void temperature() {
  final InvertibleFunction<num, num> f =
      Multiplication(9) >> Division(5) >> Addition(32);

  print(f); // * 9; / 5; + 32

  final num fahrenheit = f(40);
  print('40 degrees Celsius is $fahrenheit degrees Fahrenheit'); // 104

  final InvertibleFunction<num, num> finv = f.inverse();

  print(finv); // - 32; * 5; / 9

  final num celsius = finv(41);
  print('41 degrees Fahrenheit is $celsius degrees Celsius'); // 5
}

void pHscale() {
  final InvertibleFunction<num, num> f =
      InvertibleRealFunction.parse('log 10; * -1;');

  final num pH = f(5e-6);
  print(
      '${5e-6} moles of hydrogen ions per litre solution has a pH of $pH'); // 5.30103

  final InvertibleFunction<num, num> finv = f.inverse();

  print(finv); // / -1; exp 10;

  final num concentration = finv(8.69897);
  print(
      'pH 8.69897 solution has $concentration moles of hydrogen ions per litre'); // 2e-9
}
