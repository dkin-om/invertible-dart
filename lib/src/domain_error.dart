/// Error thrown when a function's domain is not defined or
/// function is invoked on an argument not in domain
class DomainError extends ArgumentError {
  /// Creates a domain error with message describing the problem
  DomainError([dynamic message]) : super(message);

  /// Creates a domain error containing the invalid value
  DomainError.value(dynamic value, [String? name, dynamic message])
      : super.value(value, name, message);
}

/// Error thrown when a function's domain is not defined
class DomainNotDefinedError extends DomainError {
  /// Creates a [DomainNotDefinedError] with message describing the problem
  DomainNotDefinedError([dynamic message]) : super(message);

  /// Creates a [DomainNotDefinedError] containing the invalid value
  DomainNotDefinedError.value(dynamic value, [String? name, dynamic message])
      : super.value(value, name, message ?? 'Domain is not defined');
}

/// Error thrown when a function is invoked on an argument not in domain
class NotInDomainError extends DomainError {
  /// Creates a [NotInDomainError] with message describing the problem
  NotInDomainError([dynamic message]) : super(message);

  /// Creates a [NotInDomainError] containing the invalid value
  NotInDomainError.value(dynamic value, [String? name, dynamic message])
      : super.value(value, name, message ?? 'Value not in domain');
}
