import 'package:gpa_cal/class/data_class.dart';
import 'package:gpa_cal/data/data.dart';

Sem createSem(Dept dept, int semno) {
  Sem sem = Sem(
    dept: dept,
    sem: semno,
    totalCredits: semData[semno]!.credits,
  );
  if (semno == 1) {
    for (var sub in phyCycle) {
      sem.addSub(
        sem.createSub(
          sub.credits,
          sub.num,
          sub.type,
          sub.dept,
        ),
      );
    }
  } else if (semno == 2) {
    for (var sub in chemCycle) {
      sem.addSub(
        sem.createSub(
          sub.credits,
          sub.num,
          sub.type,
          sub.dept,
        ),
      );
    }
  } else {
    for (var sub in subjects[dept]![semno]!) {
      sem.addSub(
        sem.createSub(
          sub.credits,
          sub.num,
          sub.type,
        ),
      );
    }
  }
  return sem;
}
