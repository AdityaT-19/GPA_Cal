import 'package:flutter/material.dart';

class AddGPA extends StatefulWidget {
  const AddGPA(this.addSemester, this.removeSemester, {Key? key})
      : super(key: key);
  final void Function(int semno, double sgpa) addSemester;
  final void Function(int semno) removeSemester;
  @override
  createState() => _AddGPAState();
}

final TextEditingController _SemController = TextEditingController();
final TextEditingController _GPAController = TextEditingController();
bool flagSem = false;
bool flagGPA = false;
int? _sem;
double? _gpa;
String? errorTextSem;
String? errorTextGPA;

class _AddGPAState extends State<AddGPA> {
  @override
  Widget build(BuildContext context) {
    if (flagSem) {
      errorTextSem = 'Select Semester';
    } else {
      errorTextSem = null;
    }
    if (flagGPA) {
      errorTextGPA = 'Enter Valid GPA';
    } else {
      errorTextGPA = null;
    }
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Add GPA',
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
            DropdownMenu<int>(
              controller: _SemController,
              enableFilter: true,
              dropdownMenuEntries: [
                const DropdownMenuEntry(
                  label: 'Physics Cycle',
                  value: 1,
                ),
                const DropdownMenuEntry(
                  label: 'Chemistry Cycle',
                  value: 2,
                ),
                for (int i = 3; i <= 4; i++)
                  DropdownMenuEntry(
                    label: 'Semester $i',
                    value: i,
                  ),
              ],
              onSelected: (value) {
                setState(() {
                  _sem = value;
                  flagSem = false;
                });
              },
              errorText: errorTextSem,
              width: MediaQuery.of(context).size.width * 0.75,
              label: const Text("Select Semester"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: MediaQuery.of(context).size.height * 0.03,
              ),
              child: TextField(
                controller: _GPAController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(
                  labelText: 'GPA',
                  errorText: errorTextGPA,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  double? val = double.tryParse(value);
                  _gpa = val;
                  if (_gpa == null) {
                    flagGPA = true;
                  } else {
                    flagGPA = false;
                  }
                },
              ),
            ),
            FilledButton.icon(
              onPressed: () {
                if (_sem == null) {
                  flagSem = true;
                }
                if (_gpa == null) {
                  flagGPA = true;
                }
                if (!flagSem && !flagGPA) {
                  _GPAController.clear();
                  _SemController.clear();

                  widget.addSemester(_sem!, _gpa!);
                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.add_box_outlined),
              label: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
