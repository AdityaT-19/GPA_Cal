import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gpa_cal/class/save_class.dart';
import 'package:gpa_cal/screens/selection_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SaveSemAdapter());
  await Hive.openBox('sem');

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPA Calculator',
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyanAccent,
          brightness: (Brightness.dark),
        ),
        useMaterial3: true,
      ),
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        centered: true,
        pageTransitionType: PageTransitionType.topToBottom,
        backgroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        splash: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'GPA Calculator',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ],
        ),
        splashTransition: SplashTransition.slideTransition,
        nextScreen: SelectionScreen(),
      ),
    );
  }
}
