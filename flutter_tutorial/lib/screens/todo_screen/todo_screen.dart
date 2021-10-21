import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/config/theme.dart';
import 'package:flutter_tutorial/screens/home_screen.dart/home_screen.dart';
import 'package:flutter_tutorial/screens/todo_screen/cubit/todo_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {},
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
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
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Generate cards from code and update the state (button click > update state(id, text?) > rebuild with new todo)',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'RobotoSlab',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Track cards to enable removal of complete todos (button click > update state(remove todo using id) > rebuild without todo)',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'RobotoSlab',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'Use a text field to generate the todos, store id and content',
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: 'RobotoSlab',
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: largeSize),
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
