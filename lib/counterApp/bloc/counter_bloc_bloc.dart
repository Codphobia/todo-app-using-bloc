import 'package:bloc/bloc.dart';
import 'package:bloc_todo/counterApp/bloc/counter_bloc_event.dart';

part 'counter_bloc_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterBlocState> {
  CounterBloc() : super(CounterBlocState(counter: 0)) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterBlocState(counter: state.counter + 1));
    });

    on<DecrementCounterEvent>((event, emit) {
      emit(CounterBlocState(counter: state.counter - 1));
    });
    on<ResetCounterEvent>((event, emit) {
      emit(CounterBlocState(counter: state.counter = 0));
    });
  }
}
