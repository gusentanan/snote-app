import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/presentation/pages/detail_notes_page.dart';
import 'package:mynotes/presentation/pages/home_notes_page.dart';
import 'package:mynotes/utils/constants.dart';
import 'package:mynotes/utils/route_observer.dart';
import 'package:provider/provider.dart';
import 'package:mynotes/service_locator.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<NoteBloc>(),
        ),
      ],
      child: MaterialApp(
          title: 'My Notes',
          theme: ThemeData(
              colorScheme: sColorScheme,
              primaryColor: cWhitey,
              scaffoldBackgroundColor: cWhitey,
              textTheme: sTextTheme),
          home: HomeNotesPage(),
          navigatorObservers: [routeObserver],
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case '/home':
                return MaterialPageRoute(builder: (_) => HomeNotesPage());
              case DetailNotes.ROUTE_NAME:
                final id = settings.arguments as int;
                return MaterialPageRoute(
                    builder: (_) => DetailNotes(id: id), settings: settings);
            }
          }),
    );
  }
}
