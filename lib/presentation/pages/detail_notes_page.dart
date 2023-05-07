// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/domain/bloc/note_events.dart';
import 'package:mynotes/domain/bloc/note_state.dart';
import 'package:mynotes/presentation/widget/priority_picker.dart';
import 'package:mynotes/utils/constants.dart';

import '../../domain/entities/note.dart';

class DetailNotes extends StatefulWidget {
  final int id;
  DetailNotes({required this.id});

  static const ROUTE_NAME = '/detail';

  _DetailNotes createState() => _DetailNotes();
}

class _DetailNotes extends State<DetailNotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  int color = 3;
  bool isEdited = false;

  @override
  void initState() {
    super.initState();
    if (widget.id != 0) {
      Future.microtask(() {
        context.read<NoteBloc>().add(OnGetSingleNote(widget.id));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final note = context.select<NoteBloc, Note?>((value) {
      if (value.state is NoteSuccess) {
        return (value.state as NoteSuccess).note;
      } else {
        return Note(title: '', description: '', tier: 2);
      }
    });
    titleController.text = note?.title ?? '';
    descriptionController.text = note?.description ?? '';

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Your Notes', style: sHeading1),
          backgroundColor: cWhitey,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: cNotSoBlack),
            onPressed: () {
              Navigator.pop(context, true);

              /// ADD DIALOG SAVE or move to last screen;
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  _save(context, note);
                  Navigator.pop(context, true);

                  /// ADD DIALOG SAVE
                },
                splashRadius: 22,
                icon: const Icon(
                  Icons.save,
                  color: cNotSoBlack,
                )),
            IconButton(
                onPressed: () {
                  /// ADD DIALOG DELETE
                },
                splashRadius: 22,
                icon: const Icon(
                  Icons.delete,
                  color: cNotSoBlack,
                ))
          ],
        ),
        body: Container(
          color: cWhitey,
          child: Column(
            children: [
              PriorityPicker(
                selectedIndex: note?.tier,
                onTap: (index) {
                  note?.tier = 3 - index;
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    maxLength: 155,
                    style: sHeading2,
                    onChanged: (value) {
                      note?.title = titleController.text;
                    },
                    decoration:
                        const InputDecoration.collapsed(hintText: "Title"),
                  )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  maxLength: 255,
                  controller: descriptionController,
                  style: sDescription,
                  onChanged: (value) {
                    note?.description = descriptionController.text;
                  },
                  decoration:
                      const InputDecoration.collapsed(hintText: "Description"),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context, Note? note) async {
    context.read<NoteBloc>().add(AddNoteEvent(note!));
  }

  void _delete(BuildContext context, int id) async {
    context.read<NoteBloc>().add(OnDeleteNoteEvent(id));
  }

  void _update(BuildContext contex, Note? note) async {
    context.read<NoteBloc>().add(OnUpdateNoteEvent(note!));
  }
}
