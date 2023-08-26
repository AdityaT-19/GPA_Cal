import 'package:gpa_cal/class/data_class.dart';

const Map<int, ({int credits, int subjects})> semData = {
  1: (credits: 20, subjects: 7), //phy cycle
  2: (credits: 20, subjects: 8), //chem cycle
  3: (credits: 25, subjects: 9),
  4: (credits: 25, subjects: 8),
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
const Map<Dept, Map<int, List<({int num, TypeOfSub type, double credits})>>>
    subjects = {
  Dept.CS: {
    3: sem3CSIS,
    4: sem4CSIS,
  },
  Dept.IS: {
    3: sem3CSIS,
    4: sem4CSIS,
  },
  Dept.EI: {
    3: sem3CSIS,
    4: sem4CSIS,
  },
  Dept.BT: {
    3: sem4CSIS,
    4: sem3CSIS,
  },
};
