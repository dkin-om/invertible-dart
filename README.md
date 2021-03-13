# invertible - Define invertible functions and their compositions

[![Version](https://img.shields.io/pub/v/invertible)](https://pub.dev/packages/invertible)
[![Build Status](https://travis-ci.com/dkin-om/invertible-dart.svg?branch=master)](https://travis-ci.com/dkin-om/invertible-dart)
[![Coverage Status](https://coveralls.io/repos/github/dkin-om/invertible-dart/badge.svg)](https://coveralls.io/github/dkin-om/invertible-dart)
[![License](https://img.shields.io/badge/license-MIT-green)](https://github.com/dkin-om/invertible-dart/blob/master/LICENSE)

A Dart library for defining invertible functions and their compositions

## Usage

See `example/invertible_example.dart`

```dart
final InvertibleRealFunction celsiusToFahrenheit =
    InvertibleRealFunction.parse('* 9; / 5; + 32;');

final InvertibleRealFunction fahrenheitToCelsius = celsiusToFahrenheit.inverse();

final num fahrenheit = celsiusToFahrenheit(40);
// fahrenheit == 104

final num celsius = fahrenheitToCelsius(41);
// celsius == 5
```

## Syntax

See [documentation](https://pub.dev/documentation/invertible) for more

## License

[MIT](https://github.com/dkin-om/invertible-dart/blob/master/LICENSE)
