import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/screens/home_screen.dart/home_screen.dart';
import 'package:flutter_tutorial/screens/todo_screen/cubit/todo_cubit.dart';
import 'package:flutter_tutorial/screens/todo_screen/models.dart';
import 'package:flutter_tutorial/screens/todo_screen/widgets/todo_card.dart';

class TodoScreen extends StatelessWidget {
  static const routeName = '/todo_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubit(),
      child: _TodoScreenContent(),
    );
  }
}

class _TodoScreenContent extends StatelessWidget {
  /*
ALERT
ALERT

Currently the widget tree will overflow if too many todos are rendered.
Make sure that this screen can grow and become scrollable.
Consider moving the todo creation to the top.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: BlocListener<TodoCubit, TodoState>(
          listener: (context, state) {},
          child: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              return Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: 300,
                        child: TodoCreator(
                          hasCreationError: state.todoCreationError,
                        ),
                      ),
                      SizedBox(height: mediumSize),
                      ...state.todos.map(
                        (todo) => TodoCard(
                          title: todo.title,
                          description: todo.description,
                          editMode: todo.editMode,
                          leadingOnpressed: () {
                            BlocProvider.of<TodoCubit>(context)
                                .deleteTodo(todo.id);
                          },
                          trailingOnpressed: () {
                            print(todo.editMode);
                            BlocProvider.of<TodoCubit>(context)
                                .toggleEditMode(todo.id);
                          },
                          titeFieldOnChanged: (text) {
                            print(text);
                            BlocProvider.of<TodoCubit>(context).editTodo(
                              id: todo.id,
                              title: text,
                            );
                          },
                          descriptionFieldOnChanged: (text) {
                            BlocProvider.of<TodoCubit>(context).editTodo(
                              id: todo.id,
                              description: text,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Style this widget so it looks better.
// At least so it matches the overall design of this scren.

class TodoCreator extends StatelessWidget {
  final bool hasCreationError;
  final titleTextController = TextEditingController();
  final descTextController = TextEditingController();

  TodoCreator({required this.hasCreationError});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Title',
            labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoSlab',
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          controller: titleTextController,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            labelText: 'Description',
            labelStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoSlab',
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          controller: descTextController,
        ),
        const SizedBox(height: mediumSize),
        // TODO FÖR DAVID
        // David gör en snygg error message-widget
        // Alltså en stand-alone widget i en annan fil
        // Den ska ha en default style med namn ish 'ErrorTextStyle'
        if (hasCreationError)
          Center(
            child: Text('ERROR'),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).popAndPushNamed(HomeScreen.routeName);
              },
              child: Text(
                'Home Screen',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'RobotoSlab',
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(
              width: smallSize,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                final isTodoValid = titleTextController.text.isNotEmpty &&
                    descTextController.text.isNotEmpty;
                if (isTodoValid) {
                  final timeStamp = DateTime.now();
                  BlocProvider.of<TodoCubit>(context).addTodo(
                    Todo(
                      id: '$timeStamp',
                      title: titleTextController.text,
                      description: descTextController.text,
                      created: timeStamp,
                      completed: false,
                    ),
                  );
                  resetFields();
                  BlocProvider.of<TodoCubit>(context).hasError(false);
                } else {
                  BlocProvider.of<TodoCubit>(context).hasError(true);
                }
              },
              child: Text(
                'Create Todo',
                style: TextStyle(
                  color: Colors.teal.shade900,
                  fontFamily: 'RobotoSlab',
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void resetFields() {
    titleTextController.clear();
    descTextController.clear();
  }
}
