part of 'todo_cubit.dart';

class TodoState extends Equatable {
  final List<Todo> todos;
  final bool todoCreationError;

  TodoState({
    required this.todos,
    required this.todoCreationError,
  });

  TodoState copyWith({
    List<Todo>? todos,
    bool? todoCreationError,
  }) =>
      TodoState(
        todos: todos ?? this.todos,
        todoCreationError: todoCreationError ?? this.todoCreationError,
      );

  @override
  List<Object> get props => [todos, todoCreationError];

  factory TodoState.createInitState() => TodoState(
        todos: [],
        todoCreationError: false,
      );
}
