part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterChangedEvent extends CounterEvent {
  final int incrementSize;

  // ColorState와 상관없이 param 으로 incrementSize를 받는다.
  const CounterChangedEvent({required this.incrementSize});

  @override
  List<Object> get props => [incrementSize];

  @override
  String toString() => 'CounterChangedEvent(incrementSize: $incrementSize)';
}
