import 'package:flutter/material.dart';
import 'package:gpa_cal/class/data_class.dart';
import 'package:gpa_cal/screens/result_screen.dart';

class IPScreen extends StatefulWidget {
  const IPScreen({Key? key, required this.sem}) : super(key: key);
  final Sem sem;
  @override
  createState() => _IPScreenState();
}

class _IPScreenState extends State<IPScreen> {
  Map<Sub, String?> errorText = {};
  Map<Sub, TextEditingController> _controller = {};
  @override
  void initState() {
    _controller = {
      for (var sub in widget.sem.subjects) sub: TextEditingController(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Sem sem = widget.sem;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Grades"),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Directionality(
              textDirection: TextDirection.rtl,
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: Theme.of(context).textTheme.displaySmall!.fontSize!,
                ),
                onPressed: () {
                  bool flag = true;
                  setState(
                    () {
                      for (var sub in sem.subjects) {
                        if (sub.grade == null) {
                          errorText[sub] = 'Select Grade';
                          flag = false;
                        }
                      }
                    },
                  );
                  if (flag) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultsScreen(sem: sem),
                      ),
                    );
                  }
                },
                label: Text(
                  "Calculate GPA",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                icon: Icon(
                  Icons.restart_alt_rounded,
                  size: Theme.of(context).textTheme.titleLarge!.fontSize!,
                ),
                onPressed: () {
                  setState(
                    () {
                      errorText = {};
                      for (var sub in sem.subjects) {
                        sub.grade = null;

                        _controller[sub]!.clear();
                      }
                    },
                  );
                },
                label: Text(
                  "Reset",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ),
            ),
          ].reversed.toList(),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            for (var sub in sem.subjects)
              Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      sub.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    DropdownMenu<Grade>(
                      controller: _controller[sub],
                      initialSelection: sub.grade,
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                      ),
                      errorText: errorText[sub],
                      label: const Text(
                        "Select Grade",
                      ),
                      dropdownMenuEntries: [
                        for (var grade in Grade.values)
                          DropdownMenuEntry(
                            label: grade.name.toString(),
                            value: grade,
                          ),
                      ],
                      onSelected: (value) {
                        setState(
                          () {
                            if (value != null) {
                              sub.grade = value;
                              errorText[sub] = null;
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
