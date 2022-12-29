import 'package:flutter/material.dart';

import '../components/add_habit_fab.dart';
import '../components/habit_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //data structure for list of habits
  List listOfHabits = [
    ['Morning Run', false],
    ['Reading Book', true],
    ['Coding App', true]
  ];
  bool isCompleted = false;
  final habitController = TextEditingController();

  void onHabitCompleted(bool? value, int index) {
    setState(() {
      listOfHabits[index][1] = value!;
    });
  }

  void onSave() {
    //add a habit
    setState(() {
      listOfHabits.add([habitController.text, false]);
    });
    // clear the text
    habitController.clear();
    // pop the save button
    Navigator.pop(context);
  }

  void onEditHabit(index) {
    //add a habit
    setState(() {
      listOfHabits[index][0] = habitController.text;
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
      listOfHabits.removeAt(index);
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
        itemCount: listOfHabits.length,
        itemBuilder: (BuildContext context, int index) {
          return HabitTile(
            isCompleted: listOfHabits[index][1],
            habitActivity: listOfHabits[index][0],
            onChanged: (value) => onHabitCompleted(value, index),
            onDelete: (context) => onDelete(index),
            onEdit: (context) => onEdit(index),
          );
        },
      ),
    );
  }
}
