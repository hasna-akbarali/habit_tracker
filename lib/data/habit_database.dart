import 'package:hive/hive.dart';

var box = Hive.box('Habit_Database');

class HabitDatabase {
  //initialize a list of habits
  List listOfHabits = [];

  //if the user is viewing the app for the first time
  void createDefaultHabitDatabase() {
    listOfHabits = [
      ['Read', false],
      ['Run', false]
    ];
  }

  //if the user adds, deletes,edits a habit
  void updateHabitDataBase() {}

  //if user is not viewing the database for the first time
  void loadHabitDatabase() {}
}
