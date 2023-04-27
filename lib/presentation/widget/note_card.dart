import 'package:flutter/material.dart';
import 'package:mynotes/utils/constants.dart';

import '../../domain/entities/note.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  NoteCard(this.note);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      note.title!,
                      style: sHeading2,
                    ),
                  )),
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    width: 50,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        color: colorPicker[note.tier!],
                        shape: BoxShape.circle,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Text(
                      note.description!,
                      style: sSubheader,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
