abstract class DataStatus<T> {
  final T? data;
  final String? error;

  const DataStatus(this.data, this.error);
}

class DataSuccess<T> extends DataStatus<T> {
  const DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataStatus<T> {
  const DataFailed(String? error) : super(null, error);
}
