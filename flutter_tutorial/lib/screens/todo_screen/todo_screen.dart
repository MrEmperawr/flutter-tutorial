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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TodoCubit, TodoState>(
        listener: (context, state) {},
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              color: Colors.blueAccent[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: largeSize),
                  DefaultText(
                    'My todos',
                    style: textHeaderStyle,
                  ),
                  SizedBox(height: largerSize),
                  Container(
                    width: 300,
                    height: 200,
                    child: DefaultText('Times pushed: ${state.counter}'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TodoCubit>(context).increment();
                    },
                    child: DefaultText('Press me for higher numbers'),
                  ),
                  SizedBox(height: smallSize),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<TodoCubit>(context).decrement();
                    },
                    child: DefaultText('Press me for higher numbers'),
                  ),
                  SizedBox(height: largerSize),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .popAndPushNamed(HomeScreen.routeName);
                    },
                    child: Text(
                      'Go to Homescreen',
                      style: TextStyle(color: Colors.yellowAccent),
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
