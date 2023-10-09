part of 'counter_bloc_bloc.dart';
 


class CounterBlocState  {
  int counter = 0;
  CounterBlocState({required this.counter});
}
class CounterBlocInitial extends CounterBlocState {
  CounterBlocInitial() : super(counter: 0);
}