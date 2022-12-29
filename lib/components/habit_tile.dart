import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final bool isCompleted;
  final String habitActivity;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;

  const HabitTile({
    Key? key,
    required this.isCompleted,
    required this.habitActivity,
    this.onEdit,
    this.onDelete,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                padding: const EdgeInsets.all(8.0),
                borderRadius: BorderRadius.circular(12.0),
                backgroundColor: Colors.green,
                onPressed: onEdit,
                icon: Icons.edit)
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(8),
              onPressed: onDelete,
              backgroundColor: Colors.red,
              icon: Icons.delete,
            )
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Checkbox(
                    focusColor: Colors.pink,
                    value: isCompleted,
                    onChanged: onChanged),
                Text(
                  habitActivity,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            )),
      ),
    );
  }
}
