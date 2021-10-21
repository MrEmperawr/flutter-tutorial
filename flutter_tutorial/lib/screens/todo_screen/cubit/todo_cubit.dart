import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tutorial/screens/todo_screen/models.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  // When our state is a list or some class that is easy to inititliaze with dummy values this is a good way to handle things.
  // Not always possible. Sometimes the starting state might have to be null, or fetched from somewhere.
  TodoCubit() : super(TodoState(todos: []));

  void addTodo(Todo todo) {
    final newState = state.copyWith(
      todos: [...state.todos, todo], // Explain what is going on here.
    );
    emit(newState);
  }

  void deleteTodo(String id) {
    state.todos.removeWhere((element) => element.id == id);
    emit(state);
  }

  void editTodo(String id) {
    // Do this!
  }
}
