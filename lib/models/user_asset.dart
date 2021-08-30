import 'package:SchoolGate/models/timeslot.dart';

class UserAsset {

  final String name;
  final String studentName;
  final String id;
  final List<Timeslot> timeslot;

  UserAsset({ this.name = '', this.studentName = '', this.id = '', required this.timeslot});

}