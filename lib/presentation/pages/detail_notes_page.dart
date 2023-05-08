// ignore_for_file: constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/domain/bloc/note_events.dart';
import 'package:mynotes/domain/bloc/note_state.dart';
import 'package:mynotes/presentation/widget/priority_picker.dart';
import 'package:mynotes/utils/constants.dart';

import '../../domain/entities/note.dart';
import '../widget/button.dart';
import '../widget/custom_toast.dart';

class DetailNotes extends StatefulWidget {
  final int id;
  DetailNotes({required this.id});

  static const ROUTE_NAME = '/detail';

  _DetailNotes createState() => _DetailNotes();
}

class _DetailNotes extends State<DetailNotes> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

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
      log(value.state.toString());
      if (value.state is NoteSuccess) {
        return (value.state as NoteSuccess).note;
      } else {
        return Note(title: '', description: '', tier: null);
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
            },
          ),
          actions: [
            IconButton(
                onPressed: () {
                  if (note?.title != '') {
                    displaySaveDialog(context, note!);
                  } else {
                    displayToast('The title cannot be Empty!', true);
                  }
                },
                splashRadius: 22,
                icon: const Icon(
                  Icons.save,
                  color: cNotSoBlack,
                )),
            IconButton(
                onPressed: () {
                  if (note?.id != null) {
                    displayDeleteDialog(context, note?.id);
                  } else {
                    displayToast('Save the note first to delete!', true);
                  }
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
                  note?.tier = index;
                },
              ),
              Padding(
                  padding: const EdgeInsets.all(12.0),
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
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    maxLength: 255,
                    controller: descriptionController,
                    style: sDescription,
                    onChanged: (value) {
                      note?.description = descriptionController.text;
                    },
                    decoration: const InputDecoration.collapsed(
                        hintText: "Description"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void displayDeleteDialog(BuildContext context, int? id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            title: Text(
              'Delete the Note',
              style: sHeading2,
            ),
            content: Text(
              'Are you sure to delete the note?',
              style: sDescription,
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(4.0),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: () {
                          _delete(context, id!);
                          Navigator.of(context).pop();
                          Navigator.pop(context, true);
                        },
                        textButton: 'Yes',
                        btnCommand: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Button(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      textButton: 'No',
                      btnCommand: false,
                    ))
                  ],
                ),
              ),
            ],
          );
        });
  }

  void displaySaveDialog(BuildContext context, Note note) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            title: Text(
              'Save the Note',
              style: sHeading2,
            ),
            content: Text(
              'Are you sure to save the note?',
              style: sDescription,
            ),
            actions: [
              Container(
                padding: const EdgeInsets.all(4.0),
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      child: Button(
                        onTap: () {
                          if (note.id != null) {
                            _update(context, note);
                          } else {
                            _save(context, note);
                          }
                          Navigator.of(context).pop();
                          Navigator.pop(context, true);
                        },
                        textButton: 'Yes',
                        btnCommand: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                        child: Button(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      textButton: 'No',
                      btnCommand: false,
                    ))
                  ],
                ),
              ),
            ],
          );
        });
  }

  void displayToast(String msg, bool isError) async {
    SmartDialog.show(builder: (BuildContext context) {
      return CustomToast(msg: msg, isError: isError);
    });
    await Future.delayed(const Duration(seconds: 3));
    SmartDialog.dismiss();
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
