import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/home_page.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //initialize hive
  Hive.initFlutter();

  //open box for hive
  await Hive.openBox('Habit_Database');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      home: const MyHomePage(title: 'Habit Tracker'),
      darkTheme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
      ),
    );
  }
}
