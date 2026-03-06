class Failure {
  const Failure(this.message);

  final String message;
}

class Result<T> {
  const Result._({
    this.data,
    this.failure,
  });

  final T? data;
  final Failure? failure;

  bool get isSuccess => failure == null;

  static Result<T> ok<T>(T data) => Result._(data: data);

  static Result<T> err<T>(String message) =>
      Result._(failure: Failure(message));
}
