import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 0;

  CounterBloc() : super(CounterState.initial()) {
    on<CounterChangedEvent>(
        (CounterChangedEvent event, Emitter<CounterState> emit) {
      emit(state.copyWith(count: state.count + event.incrementSize));
    });
  }
}
