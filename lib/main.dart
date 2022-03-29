// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminders/models/todo_list/todo_list_collection.dart';
import 'package:reminders/screens/add_list/add_list_screen.dart';
import 'package:reminders/screens/add_reminder/add_reminder_screen.dart';
import 'package:reminders/screens/auth/authenticate.dart';
import 'package:reminders/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
   return  FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('There was an error'),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return ChangeNotifierProvider<TodoListCollection>(
            create: (BuildContext context) => TodoListCollection(),
            child: MaterialApp(
              initialRoute: '/',
              routes: {
                '/': (context) => const Authenticate(),
                '/home': (context) => const HomeScreen(),
                '/addList': (context) => AddListScreen(),
                '/addReminder': (context) => AddReminderScreen(),
              },
              theme: ThemeData(
                  iconTheme: const IconThemeData(color: Colors.white),
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: Colors.black,
                  appBarTheme:
                      const AppBarTheme(backgroundColor: Colors.black87),
                  textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                          primary: Colors.blueAccent,
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ))),
                  dividerColor: Colors.grey[600]),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
