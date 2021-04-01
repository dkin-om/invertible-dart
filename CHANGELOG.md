## 2.0.0-nullsafety.1

- Added `DomainError`s
- Added `inverse` method to `ComposeListOfIRF` extension

## 2.0.0-nullsafety.0

- Migrated to null safety
- Changed `InvertibleFunction` and its subclasses' constructors to `const` constructors
- `InvertibleRealFunction` is an `Equatable` now
- Added extensions `ToIRF` and `ComposeListOfIRF`
- Operators `<<` and `>>` are defined only for `InvertibleRealFunction` now
- Got rid of `initInvertible`

## 1.0.0

- Initial stable release

## 1.0.0-beta.1

- Removed `dart:mirrors` import for js support

## 1.0.0-beta.0

- Initial version (beta), created by Bhargav
