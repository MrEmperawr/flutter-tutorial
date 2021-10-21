import 'package:flutter/material.dart';
import 'package:flutter_tutorial/config/constants.dart';
import 'package:flutter_tutorial/config/theme.dart';
import 'package:flutter_tutorial/screens/counter_screen/counter_screen.dart';
import 'package:flutter_tutorial/screens/todo_screen/todo_screen.dart';
import 'package:flutter_tutorial/shared/widgets/default_text.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
            Text(
              'David Haataja',
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 40,
                color: Colors.white,
                //fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Flutter Developer',
              style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 20,
                color: Colors.teal[100],
                letterSpacing: 2.5,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.white,
              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  color: Colors.teal,
                ),
                title: Text(
                  '076-415 26 80',
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontFamily: 'RobotoSlab',
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
            Card(
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
            ),
            SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed(TodoScreen.routeName);
                  },
                  child: Text(
                    'To Do',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'RobotoSlab',
                      fontSize: 18.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(CounterScreen.routeName);
                  },
                  child: Text(
                    'Counter',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'RobotoSlab',
                      fontSize: 18.0,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
