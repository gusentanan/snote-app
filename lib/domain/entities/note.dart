import 'package:equatable/equatable.dart';

class Note extends Equatable {
  int? id;
  String? title;
  String? description;
  int? tier;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.tier,
  });

  Note.toEntity(
      {this.id,
      required this.title,
      required this.description,
      required this.tier});

  @override
  List<Object?> get props => [id, title, description, tier];
}
