part of 'todo_cubit.dart';

enum TodoPhase {
  adding,
  deleting,
  pending,
  done,
}

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool todoCreationError;
  final TodoPhase phase;

  TodoState({
    required this.todos,
    required this.todoCreationError,
    required this.phase,
  });

  TodoState copyWith({
    List<Todo>? todos,
    bool? todoCreationError,
    required TodoPhase phase,
  }) =>
      TodoState(
        todos: todos ?? this.todos,
        todoCreationError: todoCreationError ?? this.todoCreationError,
        phase: phase,
      );

  factory TodoState.createInitState() => TodoState(
        todos: [],
        todoCreationError: false,
        phase: TodoPhase.done,
      );
  @override
  List<Object> get props => [
        todos,
        todoCreationError,
        phase,
      ];
}
