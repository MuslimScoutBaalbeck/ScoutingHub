import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) {
    return events.debounce(duration).asyncExpand(mapper);
  };
}

EventTransformer<E> debounceRestartable<E>(Duration duration) {
  return (events, mapper) =>
      restartable<E>().call(events.debounce(duration), mapper);
}
