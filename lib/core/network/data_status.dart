abstract class DataSatus<T> {
  final T? data;
  final String? error;

  const DataSatus(this.data, this.error);
}

class DataSuccess<T> extends DataSatus<T> {
  const DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataSatus<T> {
  const DataFailed(String? error) : super(null, error);
}
