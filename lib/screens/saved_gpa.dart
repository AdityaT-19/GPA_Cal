import 'package:flutter/material.dart';
import 'package:gpa_cal/class/save_class.dart';
import 'package:gpa_cal/data/data.dart';
import 'package:gpa_cal/screens/add_gpa.dart';
import 'package:hive/hive.dart';

class SavedGPA extends StatefulWidget {
  const SavedGPA({Key? key}) : super(key: key);
  @override
  createState() => _SavedGPAState();
}

class _SavedGPAState extends State<SavedGPA> {
  void addSemester(int semno, double sgpa) {
    final box = Hive.box('sem');

    if (box.containsKey(semno)) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: const Duration(microseconds: 500, seconds: 1),
          content: Text(
            'Semester $semno already exists',
          ),
        ),
      );
    } else {
      setState(() {
        final SaveSem sem = SaveSem(semno, sgpa, semData[semno]!.credits);
        box.put(semno, sem);
      });
    }
  }

  void removeSemester(int semno) {
    final box = Hive.box('sem');
    setState(() {
      box.delete(semno);
    });
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box('sem');
    double cgpa() {
      double cgpa = 0;
      double credit = 0;
      for (SaveSem sem in box.values) {
        cgpa += sem.sgpa * sem.credit;
        credit += sem.credit;
      }
      cgpa /= credit;
      return cgpa;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved GPA'),
        actions: [
          IconButton(
            onPressed: () {
              showAdaptiveDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Delete all saved GPA?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          )),
                  content: Text(
                    'This action cannot be undone',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () {
                        final box = Hive.box('sem');
                        setState(() {
                          box.clear();
                        });
                        Navigator.of(ctx).pop();
                      },
                      child: Text(
                        'Delete',
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.normal,
                                  color: Theme.of(context).colorScheme.error,
                                ),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.delete),
          ),
          IconButton(
            icon: const Icon(Icons.add_circle),
            onPressed: () {
              setState(() {
                showModalBottomSheet(
                  useSafeArea: true,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                  context: context,
                  builder: (ctx) {
                    return AddGPA(addSemester, removeSemester);
                  },
                );
              });
            },
          )
        ],
      ),
      body: (box.values.isEmpty)
          ? Center(
              child: Text(
                'No saved GPA \n\nTap on + to add \nor \nTap on the result',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: box.values.length,
                    itemBuilder: (ctx, index) {
                      final SaveSem sem = box.get(box.keyAt(index));
                      return Dismissible(
                        key: ValueKey(
                          ValueKey(sem),
                        ),
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                        ),
                        onDismissed: (direction) {
                          removeSemester(sem.semno);
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration:
                                  const Duration(seconds: 1, milliseconds: 500),
                              content: Text(
                                'Semester ${sem.semno} deleted',
                              ),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  addSemester(sem.semno, sem.sgpa);
                                },
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(
                              'Semester ${sem.semno}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              'GPA: ${sem.sgpa}',
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Spacer(),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.01,
                    horizontal: MediaQuery.of(context).size.width * 0.01,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).colorScheme.primary,
                        blurRadius: 10,
                        spreadRadius: 5,
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.6),
                        Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.9),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Text(
                    'CGPA : ${cgpa().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                ),
              ],
            ),
    );
  }
}
