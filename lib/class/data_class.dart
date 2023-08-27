enum Dept {
  CS,
  IS,
  PH,
  ME,
  EE,
  CH,
  CV,
  EC,
  MA,
  EI,
  BT,
  HU,
}

enum Grade {
  S,
  A,
  B,
  C,
  D,
  E,
  F,
  OTHER,
}

enum TypeOfSub {
  T0,
  L,
  OX,
  PX,
  HU,
  MA,
  P,
}

class Sem {
  Sem({
    required this.dept,
    required this.sem,
    required this.totalCredits,
  });
  final int sem;
  final Dept dept;
  final int totalCredits;
  List<Sub> subjects = [];
  Sub createSub(double credits, int num, TypeOfSub type, [Dept? dept]) {
    dept ??= this.dept;
    Sub s = Sub(
      credits: credits,
      sem: sem,
      dept: dept,
      type: type,
    );
    if (type == TypeOfSub.T0) {
      s.name = '${dept.name.toString()}$sem${num}0';
    } else if (type == TypeOfSub.L) {
      s.name = '';
    } else if (type == TypeOfSub.OX) {
      s.name = 'OE - $num';
    } else if (type == TypeOfSub.HU) {
      s.name = 'HU${sem}1X';
    } else if (type == TypeOfSub.MA) {
      s.name = 'MA${sem}1X';
    } else if (type == TypeOfSub.PX) {
      s.name = 'PE - $num';
    } else if (type == TypeOfSub.P) {
      s.name = '${dept.name.toString()}${sem}${num}P';
    }
    return s;
  }

  void addSub(Sub sub) {
    subjects.add(sub);
  }

  double get gpa {
    double totalGradePoints = 0;

    for (Sub sub in subjects) {
      totalGradePoints += sub.gradePoints;
    }
    return totalGradePoints / totalCredits;
  }
}

class Sub {
  Sub({
    required this.credits,
    required this.sem,
    required this.dept,
    required this.type,
  });
  late String name;
  final TypeOfSub type;
  final double credits;
  final int sem;
  final Dept dept;
  Grade? grade;
  double get gradePoints {
    if (grade == Grade.S) {
      return 10 * credits;
    } else if (grade == Grade.A) {
      return 9 * credits;
    } else if (grade == Grade.B) {
      return 8 * credits;
    } else if (grade == Grade.C) {
      return 7 * credits;
    } else if (grade == Grade.D) {
      return 6 * credits;
    } else if (grade == Grade.E) {
      return 5 * credits;
    } else {
      return 0;
    }
  }
}
