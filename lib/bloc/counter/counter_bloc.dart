import 'package:bloc/bloc.dart';
import 'package:untitled5/bloc/counter/counter_event.dart';
import 'package:untitled5/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState()) {
    on<IncrementCounter>(incrementCounter);
    on<DecrementCounter>(decrementCounter);
  }

  void incrementCounter(IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  void decrementCounter(DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
