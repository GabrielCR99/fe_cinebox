final class Unit {
  const Unit._();
}

const unit = Unit._();

sealed class Result<L extends Exception, R extends Object> {
  const Result();

  bool get isSuccess => this is Success;
  bool get isFailure => this is Failure;

  Object get success => (this as Success).value;
  Object get failure => (this as Failure).value;

  T when<T>({
    required T Function(R value) success,
    required T Function(L value) error,
  }) => switch (this) {
    Success(:final value) => success(value),
    Failure(:final value) => error(value),
  };
}

final class Failure<L extends Exception, R extends Object>
    extends Result<L, R> {
  final L value;

  const Failure(this.value);
}

final class Success<L extends Exception, R extends Object>
    extends Result<L, R> {
  final R value;

  const Success(this.value);
}
