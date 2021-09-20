import 'package:SchoolGate/models/gradeslot.dart';
import 'package:SchoolGate/models/scheduleslot.dart';
import 'package:SchoolGate/models/timeslot.dart';

class Tokeniser {

  List<Timeslot> tokeniseToTimeslots(String timetable) {
    List<Timeslot> result = [];
    List<String> slotsRaw = timetable.split('|');
    for (String slot in slotsRaw) {
      List<String> detail = slot.split(',');
      result.add(Timeslot(
        subject: detail[0].trim(),
        startTime: int.parse(detail[1].trim()),
        endTime: int.parse(detail[1].trim()) + timeSequencer(double.parse(detail[2].trim())),
        duration: double.parse(detail[2].trim()),
        tutor: detail[3].trim()
      ));
    }
    return result;
  }

  int timeSequencer(double hrCode) {
    int hours = hrCode.floor();
    double minutes = hrCode%1;
    int result = 100*hours + (60*(minutes)).toInt();

    return result;
  }

  List<Gradeslot> tokeniseToGradeslot(String grades) {
    List<Gradeslot> result = [];
    List<String> slotRaw = grades.split('|');
    for (String slot in slotRaw) {
      List<String> detail = slot.split(',');
      result.add(Gradeslot(
        subject: detail[0].trim(),
        testName: detail[1].trim(),
        gradeValue: detail[2].trim()
      ));
    }
    return result;
  }

  List<ScheduleSlot> tokeniseToScheduleslot(String schedule) {
    List<ScheduleSlot> result = [];
    List<String> slotRaw = schedule.split('|');
    for (String slot in slotRaw) {
      List<String> detail = slot.split(',');
      result.add(ScheduleSlot(
        event: detail[0].trim(),
        date: detail[1].trim(),
        time: detail[2].trim(),
        remarks: detail[3].trim()
      ));
    }
    return result;
  }

}