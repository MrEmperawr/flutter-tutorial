import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/config/theme.dart';
import 'package:flutter_tutorial/screens/home_screen.dart/home_screen.dart';
import 'package:flutter_tutorial/screens/counter_screen/cubit/counter_cubit.dart';
import 'package:flutter_tutorial/shared/widgets/default_text.dart';

class CounterScreen extends StatelessWidget {
  static const routeName = '/counter_screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: _CounterScreenContent(),
    );
  }
}

class _CounterScreenContent extends StatelessWidget {
  const _CounterScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {},
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              //color: Colors.blueAccent[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: largeSize),
                  DefaultText(
                    'Counter',
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
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    child: DefaultText('Press me for higher numbers'),
                  ),
                  SizedBox(height: smallSize),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                    child: DefaultText('Press me for lower numbers'),
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
