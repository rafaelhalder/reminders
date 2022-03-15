import 'package:flutter/material.dart';
import 'package:reminders/screens/home/add_list/add_list_screen.dart';
import 'package:reminders/screens/home/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addList': (context) => AddListScreen(),
      },
      theme: ThemeData.dark(),
    );
  }
}
