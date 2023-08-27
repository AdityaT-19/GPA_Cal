import 'package:flutter/material.dart';
import 'package:gpa_cal/class/data_class.dart';
import 'package:gpa_cal/class/temp_main.dart';
import 'package:gpa_cal/data/data.dart';
import 'package:gpa_cal/screens/drawer.dart';
import 'package:gpa_cal/screens/ip_screen.dart';

class SelectionScreen extends StatefulWidget {
  SelectionScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SelectionScreenState();
  }
}

class _SelectionScreenState extends State<SelectionScreen> {
  final TextEditingController _DeptController = TextEditingController();
  final TextEditingController _SemController = TextEditingController();
  Dept? _dept;
  int? _sem;
  bool flagDept = false;
  bool flagSem = false;
  String? errorTextDept;
  String? errorTextSem;
  @override
  void dispose() {
    _DeptController.dispose();
    _SemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    if (flagDept) {
      errorTextDept = 'Select Department';
    } else {
      errorTextDept = null;
    }
    if (flagSem) {
      errorTextSem = 'Select Semester';
    } else {
      errorTextSem = null;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Department and Semester"),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: DrawerSave(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownMenu<Dept>(
                controller: _DeptController,
                initialSelection: null,
                enableFilter: true,
                errorText: errorTextDept,
                label: const Text(
                  "Select Department",
                ),
                dropdownMenuEntries: [
                  for (Dept dept in subjects.keys)
                    DropdownMenuEntry(
                      label: dept.name,
                      value: dept,
                    ),
                ],
                onSelected: (value) {
                  setState(
                    () {
                      _dept = value;
                      flagDept = false;
                    },
                  );
                },
                width: MediaQuery.of(context).size.width *
                    (MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? 0.5
                        : 0.75),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownMenu<int>(
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
                  _sem = value;
                  flagSem = false;
                },
                errorText: errorTextSem,
                width: MediaQuery.of(context).size.width *
                    (MediaQuery.of(context).size.width >
                            MediaQuery.of(context).size.height
                        ? 0.5
                        : 0.75),
                label: const Text("Select Semester"),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      label: Text(
                        "Submit",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (_dept == null) {
                              flagDept = true;
                            }
                            if (_sem == null) {
                              flagSem = true;
                            }
                          },
                        );
                        if (_dept != null && _sem != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  IPScreen(sem: createSem(_dept!, _sem!)),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      icon: Icon(
                        Icons.settings_backup_restore,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                      label: Text(
                        "Reset",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            errorTextDept = null;
                            errorTextSem = null;
                            _dept = null;
                            _sem = null;
                            flagDept = false;
                            flagSem = false;
                            _DeptController.clear();
                            _SemController.clear();
                          },
                        );
                      },
                    ),
                  ),
                ].reversed.toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
