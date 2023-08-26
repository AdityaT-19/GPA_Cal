import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gpa_cal/class/data_class.dart';
import 'package:confetti/confetti.dart';
import 'package:gpa_cal/class/save_class.dart';
import 'package:gpa_cal/screens/saved_gpa.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({Key? key, required this.sem}) : super(key: key);
  final Sem sem;
  @override
  createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final ConfettiController _controllerCenter = ConfettiController(
    duration: const Duration(
      seconds: 1,
      milliseconds: 500,
    ),
  );
  @override
  void initState() {
    if (widget.sem.gpa > 9) {
      Future.delayed(
        const Duration(seconds: 1),
        () {
          _controllerCenter.play();
        },
      );
      super.initState();
    }
  }

  void saveSem() async {
    final Box box = Hive.box('sem');
    if (box.containsKey(widget.sem.sem)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
              'Semester ${widget.sem.sem} already exists',
            ),
            action: SnackBarAction(
              label: 'Replace',
              onPressed: () {
                box.delete(widget.sem.sem);
                saveSem();
              },
            )),
      );
      return;
    }
    final SaveSem sem = SaveSem(
      widget.sem.sem,
      widget.sem.gpa,
      widget.sem.totalCredits,
    );
    await box.put(sem.semno, sem);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Semester ${widget.sem.sem} saved',
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            box.delete(sem.semno);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final Sem sem = widget.sem;
    final double gpa = sem.gpa;
    Color bgColor;
    bgColor = gpa > 9
        ? const Color.fromARGB(255, 37, 205, 42)
        : gpa > 8
            ? Colors.blueAccent
            : gpa > 7
                ? const Color.fromARGB(255, 213, 229, 69)
                : gpa > 6
                    ? const Color.fromARGB(255, 255, 216, 59)
                    : gpa > 5
                        ? Colors.orange
                        : Colors.red;

    for (var sub in sem.subjects) {
      if (sub.grade == Grade.F || sub.grade == Grade.OTHER) {
        bgColor = Colors.red;
        break;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: bgColor.withAlpha(170),
        actions: [
          if (gpa > 9)
            IconButton(
              onPressed: () {
                _controllerCenter.play();
              },
              icon: const Icon(Icons.celebration_outlined),
            ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SavedGPA(),
                ),
              );
            },
            icon: const Icon(Icons.save_alt),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              if (MediaQuery.of(context).platformBrightness == Brightness.dark)
                bgColor.withOpacity(0.1),
              if (MediaQuery.of(context).platformBrightness == Brightness.light)
                bgColor.withOpacity(0.5),
              if (MediaQuery.of(context).platformBrightness == Brightness.light)
                bgColor.withOpacity(0.45),
              bgColor,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          showAdaptiveDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("GPA"),
                              content: Text(
                                "Your GPA is ${gpa.toStringAsFixed(2)}",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    saveSem();
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Save"),
                                )
                              ],
                            ),
                          );
                        },
                        borderRadius: BorderRadius.all(
                          Radius.circular(130.0),
                        ),
                        child: CircularPercentIndicator(
                          radius: 130.0,
                          animation: true,
                          animationDuration: 1200,
                          lineWidth: 15.0,
                          percent: gpa / 10,
                          center: Text(
                            "GPA : ${gpa.toStringAsFixed(2)}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: bgColor.withOpacity(0.5),
                          progressColor: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .background
                                .withOpacity(0.4),
                            Theme.of(context).colorScheme.background,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: Table(
                        border: TableBorder.all(
                          color: bgColor,
                        ),
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              color: bgColor,
                            ),
                            children: [
                              Text(
                                'Subject',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                              Text(
                                'Grade',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                              ),
                            ],
                          ),
                          for (var sub in sem.subjects)
                            TableRow(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                              ),
                              children: [
                                Text(
                                  sub.name,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  sub.grade!.name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerCenter,
                blastDirectionality: BlastDirectionality.explosive,
                numberOfParticles: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
