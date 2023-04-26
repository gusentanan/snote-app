import 'package:equatable/equatable.dart';

class DatabaseException implements Exception {
  final String msg;

  DatabaseException(this.msg);
}

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}
