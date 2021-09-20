/// This object stores all the assets of a user
/// Call these variables to draw timetable and grades

import 'package:SchoolGate/models/gradeslot.dart';
import 'package:SchoolGate/models/scheduleslot.dart';
import 'package:SchoolGate/models/timeslot.dart';

class UserAsset {

  final String name;
  final String studentName;
  final String id;
  final List<Timeslot> timeslot;
  final List<Gradeslot> gradeslot;
  final List<ScheduleSlot> scheduleslot;
  
  UserAsset({ this.name = '', this.studentName = '', this.id = '', this.timeslot, this.gradeslot, this.scheduleslot});

}