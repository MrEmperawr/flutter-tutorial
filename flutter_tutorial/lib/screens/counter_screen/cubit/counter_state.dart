part of 'counter_cubit.dart';

class CounterState extends Equatable {
  final int timesPushed;
  final int counter;

  CounterState({
    required this.timesPushed,
    required this.counter,
  });

  CounterState copyWith({
    int? timesPushed,
    int? counter,
  }) {
    return CounterState(
      timesPushed: timesPushed ?? this.timesPushed,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [timesPushed, counter];
}
