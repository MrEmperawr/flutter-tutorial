part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final int timesPushed;
  final int counter;

  TodoState({
    required this.timesPushed,
    required this.counter,
  });

  TodoState copyWith({
    int? timesPushed,
    int? counter,
  }) {
    return TodoState(
      timesPushed: timesPushed ?? this.timesPushed,
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [timesPushed, counter];
}
