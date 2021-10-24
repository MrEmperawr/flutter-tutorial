import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/config/theme.dart';
import 'package:flutter_tutorial/screens/home_screen.dart/home_screen.dart';
import 'package:flutter_tutorial/screens/todo_screen/cubit/todo_cubit.dart';
import 'package:flutter_tutorial/screens/todo_screen/models.dart';
import 'package:flutter_tutorial/shared/widgets/default_text.dart';

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

class _TodoScreenContent extends StatefulWidget {
  const _TodoScreenContent({Key? key}) : super(key: key);

  @override
  _TodoScreenContentState createState() => _TodoScreenContentState();
}

class _TodoScreenContentState extends State<_TodoScreenContent> {
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
              //print(state);
              return Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      width: 300,
                      child: TodoCreator(),
                    ),
                    SizedBox(height: mediumSize),
                    /*ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          //color: Colors.amber[colorCodes[index]],
                          child: Center(
                              child: Text('Entry ${state.todos[index].id}')),
                        );
                      },
                    ),*/
                    // What is this? Explain what's going on here.
                    ...state.todos.map(
                      (todo) => Card(
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 25.0),
                        child: ListTile(
                          leading: IconButton(
                              // Render a different icon if it is not done
                              icon: Icon(Icons.remove_circle_outline),
                              color: Colors.teal,
                              onPressed: () {
                                //print(todo.id);
                                BlocProvider.of<TodoCubit>(context)
                                    .deleteTodo(todo.id);
                                setState(() {});
                              }),
                          trailing: IconButton(
                              // Render a different icon if it is not done
                              icon: Icon(Icons.settings),
                              color: Colors.teal,
                              onPressed: () {
                                print('tis true');
                              }),
                          title: Text(todo.title),
                          subtitle: Row(
                            children: [
                              Text(todo.description),
                              const SizedBox(width: smallSize),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
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
class TodoCreator extends StatefulWidget {
  const TodoCreator({Key? key}) : super(key: key);

  @override
  _TodoCreatorState createState() => _TodoCreatorState();
}

class _TodoCreatorState extends State<TodoCreator> {
  final titleTextController = TextEditingController();
  final descTextController = TextEditingController();

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
                BlocProvider.of<TodoCubit>(context).addTodo(
                  Todo(
                    id: '${DateTime.now()}', // Tell me what this is. Why did I do this?
                    title: titleTextController.text,
                    description: descTextController.text,
                    created: DateTime.now(),
                    isDone: false, // Why false here?
                  ),
                );
                resetFields();
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

    //setState(() {});
  }
}
