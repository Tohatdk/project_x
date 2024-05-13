import 'package:rxdart/rxdart.dart';

Stream<Event> debounceEvent<Event extends Object>(
  Stream<Event> events,
  Stream<Event> Function(Event) mapper,
) =>
    events.debounceTime(const Duration(milliseconds: 500)).asyncExpand(mapper);
