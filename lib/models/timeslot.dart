/// This object stores all information for a populated timeslot_tile

class Timeslot {

  final String subject;
  final int startTime;
  final int endTime;
  final double duration;
  final String tutor;

  Timeslot({ this.subject = '', this.startTime = 0000, this.endTime = 0000, this.duration = 0.0, this.tutor = '' });
  
}