import '../errors/failures.dart';

sealed class Result<T> {
  const Result();

  factory Result.success(T value) = Success<T>;
  factory Result.failure(Failure failure) = FailureResult<T>;

  R fold<R>(R Function(Failure failure) onFailure, R Function(T value) onSuccess) {
    return switch (this) {
      Success(value: final v) => onSuccess(v),
      FailureResult(failure: final f) => onFailure(f),
    };
  }
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);
}
