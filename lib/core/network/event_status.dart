abstract class EventStatus {}

class EventLoading<T> extends EventStatus {}

class EventCompleted<T> extends EventStatus {
  final T data;

  EventCompleted(this.data);
}

class EventError<T> extends EventStatus {
  final String message;

  EventError(this.message);
}
