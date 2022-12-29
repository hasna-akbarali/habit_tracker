import 'package:flutter/material.dart';

class AlertHabitFAB extends StatelessWidget {
  final TextEditingController habitController;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const AlertHabitFAB({
    Key? key,
    required this.habitController,
    required this.onSave,
    required this.hintText,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: // Note: Same code is applied for the TextFormField as well
          TextField(
        controller: habitController,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.black), //<-- SEE HERE
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black), //<-- SEE HERE
          ),
        ),
      ),
      actions: [
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.black,
          onPressed: onSave,
          textColor: Colors.white,
          child: const Text('Save'),
        ),
        MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          color: Colors.black,
          onPressed: onCancel,
          textColor: Colors.white,
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
