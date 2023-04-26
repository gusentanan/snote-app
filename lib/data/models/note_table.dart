import 'package:equatable/equatable.dart';

import '../../domain/entities/note.dart';

class NoteTable extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final int? tier;

  NoteTable({
    required this.id,
    required this.title,
    required this.description,
    required this.tier,
  });

  factory NoteTable.fromEntity(Note note) => NoteTable(
      id: note.id,
      title: note.title,
      description: note.description,
      tier: note.tier);

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'tier': tier,
      };

  factory NoteTable.fromMap(Map<String, dynamic> map) => NoteTable(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        tier: map['tier'],
      );

  Note toEntity() =>
      Note.toEntity(id: id, title: title, description: description, tier: tier);

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, tier];
}
