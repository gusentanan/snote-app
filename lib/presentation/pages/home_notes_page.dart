import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/domain/bloc/note_events.dart';
import 'package:mynotes/domain/bloc/note_state.dart';
import 'package:mynotes/presentation/pages/detail_notes_page.dart';
import 'package:mynotes/utils/constants.dart';
import 'package:mynotes/utils/route_observer.dart';

import '../../domain/entities/note.dart';
import '../../utils/helpers.dart';
import '../widget/note_card.dart';

class HomeNotesPage extends StatefulWidget {
  @override
  _HomeNotesPage createState() => _HomeNotesPage();
}

class _HomeNotesPage extends State<HomeNotesPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<NoteBloc>().add(OnGetNoteListEvent());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Future.microtask(() => context.read<NoteBloc>().add(OnGetNoteListEvent()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Notes",
          style: sHeading1,
        ),
        centerTitle: true,
        backgroundColor: cWhitey,
      ),
      body: Container(
        color: cWhitey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<NoteBloc, NoteState>(
            builder: (context, state) {
              if (state is NoteListEmpty || state is NoteEmpty) {
                // final List<Note> myNote =
                //     List<Note>.filled(2, testNote1, growable: false);
                // myNote[1] = testNote2;

                // return ListView.builder(
                //   itemBuilder: (context, index) {
                //     final notes = myNote[index];
                //     return NoteCard(notes);
                //   },
                //   itemCount: myNote.length,
                // );

                return Center(
                    child: Text(
                  "Tap the button to add a Note!",
                  style: sSubheader,
                ));
              } else if (state is NoteListSuccess) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final notes = state.noteList[index];
                    return NoteCard(notes);
                  },
                  itemCount: state.noteList.length,
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DetailNotes.ROUTE_NAME, arguments: 0);
        },
        tooltip: "Add Note",
        shape: const CircleBorder(
            side: BorderSide(color: Colors.transparent, width: 1.0)),
        backgroundColor: Colors.white,
        child: const Icon(Icons.add, color: cNotSoBlack),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
