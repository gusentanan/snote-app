import 'package:equatable/equatable.dart';

class Note extends Equatable {
  int? id;
  String? title;
  String? description;
  int? tier;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.tier,
  });

  Note.toEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.tier});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, tier];
}
