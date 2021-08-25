class ResultType<V> {
  V? _success;
  Exception? _failure;

  ResultType.success(V value) : _success = value;
  ResultType.failure(Exception failure) : _failure = failure;

  ResultType<V> onSuccess(Function(V value) completion) {
    if (_success != null) {
      completion(_success!);
    }
    return this;
  }

  ResultType<V> catchError(Function(Exception exception) completion) {
    if (_failure != null) {
      completion(_failure!);
    }

    return this;
  }
}

const UnknownException = _UnknownException();

class _UnknownException implements Exception {
  const _UnknownException();
  @override
  String toString() => 'UnknownException';
}
