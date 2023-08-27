import 'package:gpa_cal/class/data_class.dart';

const Map<int, ({int credits, int subjects})> semData = {
  1: (credits: 20, subjects: 7), //phy cycle
  2: (credits: 20, subjects: 8), //chem cycle
  3: (credits: 25, subjects: 9),
  4: (credits: 25, subjects: 8),
  5: (credits: 25, subjects: 8),
  6: (credits: 25, subjects: 8),
  7: (credits: 19, subjects: 8),
  8: (credits: 16, subjects: 8),
};
const List<({int num, TypeOfSub type, double credits, Dept? dept})> phyCycle = [
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
    dept: Dept.MA,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
    dept: Dept.PH,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 3,
    dept: Dept.ME,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 3,
    dept: Dept.EE,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 3,
    dept: Dept.CS,
  ),
  (
    num: 2,
    type: TypeOfSub.L,
    credits: 1.5,
    dept: Dept.PH,
  ),
  (
    num: 2,
    type: TypeOfSub.L,
    credits: 1.5,
    dept: Dept.CS,
  ),
];
const List<({int num, TypeOfSub type, double credits, Dept? dept})> chemCycle =
    [
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
    dept: Dept.MA,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
    dept: Dept.CH,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 3,
    dept: Dept.CV,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 3,
    dept: Dept.EC,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 2.5,
    dept: Dept.ME,
  ),
  (
    num: 2,
    type: TypeOfSub.L,
    credits: 1.5,
    dept: Dept.CH,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 1,
    dept: Dept.HU,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 1,
    dept: Dept.HU,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem3CSIS = [
  (
    num: 1,
    type: TypeOfSub.MA,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 4,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 5,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.HU,
    credits: 2,
  ),
  (
    num: 6,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem3EC = [
  (
    num: 1,
    type: TypeOfSub.MA,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 4,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 5,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.HU,
    credits: 2,
  ),
  (
    num: 6,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem4EC = [
  (
    num: 1,
    type: TypeOfSub.MA,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 4,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 5,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 6,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem4CSIS = [
  (
    num: 1,
    type: TypeOfSub.MA,
    credits: 3,
  ),
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 4,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 5,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 6,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem5CSIS = [
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 4,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 5,
    type: TypeOfSub.PX,
    credits: 3,
  ),
  (
    num: 6,
    type: TypeOfSub.OX,
    credits: 3,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 8,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem6CS = [
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 4,
    type: TypeOfSub.PX,
    credits: 3,
  ),
  (
    num: 5,
    type: TypeOfSub.OX,
    credits: 3,
  ),
  (
    num: 6,
    type: TypeOfSub.OX,
    credits: 3,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 8,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 9,
    type: TypeOfSub.P,
    credits: 1.5,
  ),
];
const List<({int num, TypeOfSub type, double credits})> sem6IS = [
  (
    num: 1,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 2,
    type: TypeOfSub.T0,
    credits: 4,
  ),
  (
    num: 3,
    type: TypeOfSub.T0,
    credits: 3,
  ),
  (
    num: 4,
    type: TypeOfSub.PX,
    credits: 3,
  ),
  (
    num: 5,
    type: TypeOfSub.OX,
    credits: 3,
  ),
  (
    num: 6,
    type: TypeOfSub.OX,
    credits: 3,
  ),
  (
    num: 7,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 8,
    type: TypeOfSub.L,
    credits: 1.5,
  ),
  (
    num: 9,
    type: TypeOfSub.P,
    credits: 1.5,
  ),
];
const Map<Dept, Map<int, List<({int num, TypeOfSub type, double credits})>>>
    subjects = {
  Dept.CS: {
    3: sem3CSIS,
    4: sem4CSIS,
    5: sem5CSIS,
    6: sem6CS,
  },
  Dept.IS: {
    3: sem3CSIS,
    4: sem4CSIS,
    5: sem5CSIS,
    6: sem6IS,
  },
  Dept.EC: {
    3: sem3EC,
    4: sem4EC,
    5: sem5CSIS,
    6: sem6IS,
  },
  Dept.EI: {
    3: sem3CSIS,
    4: sem4CSIS,
    5: sem5CSIS,
    6: sem6IS,
  },
  Dept.BT: {
    3: sem4CSIS,
    4: sem3CSIS,
    5: sem5CSIS,
    6: sem6IS,
  },
};
