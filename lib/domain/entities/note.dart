import 'package:equatable/equatable.dart';

class Note extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final int? tier;

  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.tier,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description, tier];
}
