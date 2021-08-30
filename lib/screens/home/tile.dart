import 'package:flutter/material.dart';
import 'package:SchoolGate/models/timeslot.dart';

class Tile extends StatelessWidget {
  
  final Timeslot slot;
  Tile({ required this.slot });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: Icon(
            Icons.book_rounded,
            color: Colors.teal,
            ),
            title: Text(slot.subject),
            subtitle: Text(slot.startTime.toString() + ' - ' + slot.endTime.toString() + '\n'
            + slot.duration.toString() + ' hr\n'
            + slot.tutor),
        )
      )
    );
  }
}