part of 'todo_cubit.dart';

enum TodoPhase {
  adding,
  deleting,
  editing,
  pending,
  done,
}

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool todoCreationError;
  final TodoPhase phase;
  final bool editMode;

  TodoState({
    required this.todos,
    required this.todoCreationError,
    required this.phase,
    this.editMode = false,
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
