import 'package:flutter/material.dart';
import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/config/theme.dart';
import 'package:flutter_tutorial/screens/todo_screen/todo_screen.dart';
import 'package:flutter_tutorial/shared/widgets/default_text.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CircleAvatar(radius: 100),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultText(
                  'David',
                ),
                SizedBox(width: 20),
                DefaultText(
                  'Haataja',
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        'Title:',
                        style: smallTextStyle,
                      ),
                      SizedBox(
                        width: mediumSize,
                      ),
                      DefaultText(
                        'Supreme Coder Guy',
                        style: smallTextStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        'Fun fact:',
                        style: smallTextStyle,
                      ),
                      SizedBox(
                        width: mediumSize,
                      ),
                      DefaultText(
                        'Can walk for very long stretches.',
                        style: smallTextStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DefaultText(
                        'Obsession:',
                        style: smallTextStyle,
                      ),
                      SizedBox(
                        width: mediumSize,
                      ),
                      DefaultText(
                        'Endless Space 2',
                        style: smallTextStyle,
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(TodoScreen.routeName);
                    },
                    child: Text(
                      'Go to Todo screen',
                      style: TextStyle(color: Colors.yellowAccent),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
