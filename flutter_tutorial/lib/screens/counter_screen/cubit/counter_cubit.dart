import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 0, timesPushed: 0));

  void increment() => emit(state.copyWith(
      counter: state.counter + 1, timesPushed: state.timesPushed + 1));

  void decrement() => emit(state.copyWith(
      counter: state.counter - 1, timesPushed: state.timesPushed + 1));
}
