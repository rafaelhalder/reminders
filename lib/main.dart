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
        '/': (context) => const HomeScreen(),
        // ignore: prefer_const_constructors
        '/addList': (context) => AddListScreen(),
      },
      theme: ThemeData(
        iconTheme: const IconThemeData(color: Colors.white),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black87),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.blueAccent,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            )
          )
        )
      ),
    );
  }
}
