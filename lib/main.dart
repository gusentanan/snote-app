import 'package:flutter/material.dart';
import 'package:mynotes/presentation/pages/home_notes_page.dart';
import 'package:mynotes/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Notes',
      theme: ThemeData(
          colorScheme: sColorScheme,
          primaryColor: cWhitey,
          scaffoldBackgroundColor: cWhitey,
          textTheme: sTextTheme),
      home: HomeNotesPage(),
    );
  }
}
