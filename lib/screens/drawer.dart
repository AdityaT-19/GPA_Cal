import 'package:flutter/material.dart';
import 'package:gpa_cal/screens/saved_gpa.dart';

class DrawerSave extends StatelessWidget {
  const DrawerSave({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'GPA Calculator',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'By : \t\t\tA.D.I',
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.save),
            title: Text('Saved GPA'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SavedGPA()));
            },
          ),
        ],
      ),
    );
  }
}
