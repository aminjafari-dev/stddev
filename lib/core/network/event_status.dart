import 'package:flutter/material.dart';

@immutable
abstract class EventStatus<T> {}

class EventLoading<T> extends EventStatus<T> {}

class EventInitial<T> extends EventStatus<T> {}

class EventCompleted<T> extends EventStatus<T> {
  final T data;

  EventCompleted(this.data);
}

class EventError<T> extends EventStatus<T> {
  final String message;

  EventError(this.message);
}
