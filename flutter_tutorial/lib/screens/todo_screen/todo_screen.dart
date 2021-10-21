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

class _TodoScreenContent extends StatelessWidget {
  const _TodoScreenContent({Key? key}) : super(key: key);

  Widget buildCards() {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.email,
          color: Colors.teal,
        ),
        title: Text(
          'haataja.david@gmail.com',
          style: TextStyle(
            color: Colors.teal.shade900,
            fontFamily: 'RobotoSlab',
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

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
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {},
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            print(state);
            return Container(
              width: double.infinity,
              //color: Colors.blueAccent[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultText(
                    'To Do',
                    style: textHeaderStyle,
                  ),
                  SizedBox(height: largeSize),
                  // What is this? Explain what's going on here.
                  ...state.todos.map(
                    (todo) => Card(
                      child: ListTile(
                        leading: Icon(
                          // Render a different icon if it is not done
                          Icons.check_circle,
                          color: Colors.teal,
                        ),
                        title: Text(todo.title),
                        subtitle: Row(
                          children: [
                            Text(todo.description),
                            const SizedBox(width: smallSize),
                            Checkbox(
                                value: todo.isDone,
                                onChanged: (value) {
                                  // Do something here to check this particular todo
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ctrl + k + c on windows to comment code and ctrl + k + u to uncomment, fucking dumb
                  // Card(
                  //   margin:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  //   child: ListTile(
                  //     leading: Icon(
                  //       Icons.check_circle,
                  //       color: Colors.teal,
                  //     ),
                  //     title: Text(
                  //       'Generate cards from code and update the state (button click > update state(id, text?) > rebuild with new todo)',
                  //       style: TextStyle(
                  //         color: Colors.teal.shade900,
                  //         fontFamily: 'RobotoSlab',
                  //         fontSize: 18.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  //   child: ListTile(
                  //     leading: Icon(
                  //       Icons.check_circle,
                  //       color: Colors.teal,
                  //     ),
                  //     title: Text(
                  //       'Track cards to enable removal of complete todos (button click > update state(remove todo using id) > rebuild without todo)',
                  //       style: TextStyle(
                  //         color: Colors.teal.shade900,
                  //         fontFamily: 'RobotoSlab',
                  //         fontSize: 18.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Card(
                  //   margin:
                  //       EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  //   child: ListTile(
                  //     leading: Icon(
                  //       Icons.check_circle,
                  //       color: Colors.teal,
                  //     ),
                  //     title: Text(
                  //       'Use a text field to generate the todos, store id and content',
                  //       style: TextStyle(
                  //         color: Colors.teal.shade900,
                  //         fontFamily: 'RobotoSlab',
                  //         fontSize: 18.0,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: largeSize),
                  Container(
                    width: 300,
                    child: TodoCreator(),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed(HomeScreen.routeName);
                    },
                    child: Text(
                      'Go to To Home Screen',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'RobotoSlab',
                        fontSize: 18.0,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
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
  String title = '';
  String description = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(hintText: 'Title'),
          onChanged: (value) {
            title = value;
          },
        ),
        const SizedBox(height: largeSize),
        TextField(
          decoration: InputDecoration(hintText: 'Description'),
          onChanged: (value) {
            description = value;
          },
        ),
        const SizedBox(height: largeSize),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<TodoCubit>(context).addTodo(
                  Todo(
                    id: '$title$description${DateTime.now()}', // Tell me what this is. Why did I do this?
                    title: title,
                    description: description,
                    created: DateTime.now(),
                    isDone: false, // Why false here?
                  ),
                );
                resetState();
              },
              child: Text('Create Todo'),
            ),
          ],
        ),
      ],
    );
  }

  void resetState() {
    setState(() {
      title = '';
      description = '';
    });
  }
}
