part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;

  const CounterState({this.count = 0});

  factory CounterState.initial() => const CounterState();

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  @override
  List<Object> get props => [count];

  @override
  String toString() => 'CounterState(count: $count)';
}
