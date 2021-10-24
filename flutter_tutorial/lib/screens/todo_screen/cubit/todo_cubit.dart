import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/screens/todo_screen/models.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  // When our state is a list or some class that is easy to inititliaze with dummy values this is a good way to handle things.
  // Not always possible. Sometimes the starting state might have to be null, or fetched from somewhere.
  TodoCubit() : super(TodoState.createInitState());

  void addTodo(Todo todo) {
    final newState = state.copyWith(
      todos: [...state.todos, todo], // Explain what is going on here.
      phase: state.phase,
    );
    emit(newState);
  }

  void deleteTodo(String id) {
    emit(state.copyWith(phase: TodoPhase.deleting));
    final newState = state.copyWith(
      todos: [...state.todos..removeWhere((element) => element.id == id)],
      phase: TodoPhase.done,
    );
    emit(newState);
  }

  void toggleEditMode(String id) {
    emit(state.copyWith(phase: TodoPhase.editing));

    emit(
      state.copyWith(
        phase: TodoPhase.done,
        todos: [
          ...state.todos.map((todo) {
            if (todo.id == id) {
              return todo.copyWith(editMode: !todo.editMode);
            }
            return todo;
          }).toList(),
        ],
      ),
    );
  }

  void editTodo({
    String? title,
    String? description,
    bool? completed,
    required String id,
  }) {
    emit(state.copyWith(phase: TodoPhase.editing));
    emit(
      state.copyWith(
        phase: TodoPhase.done,
        todos: [
          ...state.todos.map((todo) {
            if (todo.id == id) {
              return todo.copyWith(
                title: title,
                description: description,
              );
            }
            return todo;
          }).toList(),
        ],
      ),
    );
    // Do the rest - check out toggleEditMode for inspiration
    // Find the correct todo
    // Use copy with to change title, description or completed
    // Emit the new copy
  }

  void hasError(bool creationError) {
    final newState =
        state.copyWith(todoCreationError: creationError, phase: state.phase);
    emit(newState);
  }
}
