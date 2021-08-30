import 'package:SchoolGate/models/timeslot.dart';

class Tokeniser {

  List<Timeslot> tokeniseToSlots(String timetable) {
    List<Timeslot> result = [];
    List<String> slotsRaw = timetable.split('|');
    for (String slot in slotsRaw) {
      List<String> detail = slot.split(',');
      result.add(Timeslot(
        subject: detail[0],
        startTime: int.parse(detail[1]),
        endTime: int.parse(detail[1]) + 100*int.parse(detail[2]), // double to int parse
        duration: double.parse(detail[2]),
        tutor: detail[3]));
    }
    return result;
  }



}