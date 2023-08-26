import 'package:hive/hive.dart';
part 'save_class.g.dart';

@HiveType(typeId: 0)
class SaveSem extends HiveObject {
  @HiveField(0)
  int semno;
  @HiveField(1)
  double sgpa;
  @HiveField(2)
  int credit;

  SaveSem(this.semno, this.sgpa, this.credit);
}
