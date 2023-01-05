import 'package:flutter/material.dart';
import 'package:habit_tracker/data/habit_database.dart';
import 'package:hive/hive.dart';

import '../components/add_habit_fab.dart';
import '../components/habit_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box('Habit_Database');

  // //data structure for list of habits
  // List listOfHabits = [
  //   ['Morning Run', false],
  //   ['Reading Book', true],
  //   ['Coding App', true]
  // ];
  bool isCompleted = false;
  final habitController = TextEditingController();

  @override
  void initState() {
    // check if the user is using the app for the first time
    // if yes then initialize the database within default value
    if (_myBox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultHabitDatabase();
    }

    // if no then load the previous data to display on to the screen
    else {
      db.loadHabitDatabase();
    }

    super.initState();
  }

  void onHabitCompleted(bool? value, int index) {
    setState(() {
      db.listOfHabits[index][1] = value!;
    });
  }

  void onSave() {
    //add a habit
    setState(() {
      db.listOfHabits.add([habitController.text, false]);
    });
    // clear the text
    habitController.clear();
    // pop the save button
    Navigator.pop(context);
  }

  void onEditHabit(index) {
    //add a habit
    setState(() {
      db.listOfHabits[index][0] = habitController.text;
    });
    // clear the text
    habitController.clear();
    // pop the save button
    Navigator.pop(context);
  }

  void onEdit(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertHabitFAB(
          hintText: habitController.text,
          habitController: habitController,
          onSave: () => onEditHabit(index),
          onCancel: onCancel,
        );
      },
    );
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onDelete(int index) {
    setState(() {
      db.listOfHabits.removeAt(index);
    });
  }

  void onPressedFAB() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return AlertHabitFAB(
          hintText: 'Enter habit here...',
          habitController: habitController,
          onSave: onSave,
          onCancel: onCancel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressedFAB,
        child: const Icon(Icons.add),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: db.listOfHabits.length,
        itemBuilder: (BuildContext context, int index) {
          return HabitTile(
            isCompleted: db.listOfHabits[index][1],
            habitActivity: db.listOfHabits[index][0],
            onChanged: (value) => onHabitCompleted(value, index),
            onDelete: (context) => onDelete(index),
            onEdit: (context) => onEdit(index),
          );
        },
      ),
    );
  }
}
