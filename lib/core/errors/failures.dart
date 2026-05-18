abstract class Failure {
  final String message;
  final String? code;

  const Failure(this.message, [this.code]);

  @override
  String toString() => 'Failure: $message${code != null ? ' (Code: $code)' : ''}';
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message, [super.code]);
}
