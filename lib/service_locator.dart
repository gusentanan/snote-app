import 'package:get_it/get_it.dart';
import 'package:mynotes/data/datasources/db/notes_database_helper.dart';
import 'package:mynotes/data/datasources/note_local_datasource.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/domain/repository/note_repository.dart';
import 'package:mynotes/domain/usecase/get_note_list_usecase.dart';
import 'package:mynotes/domain/usecase/insert_note_usecase.dart';

final locator = GetIt.instance;

void init() {
  // Bloc Locator
  locator.registerFactory(() => NoteBloc(locator(), locator()));

  // UseCase Locator
  locator.registerLazySingleton(() => GetNoteListUsecase(locator()));
  locator.registerLazySingleton(() => InsertNoteUsecase(locator()));

  // Repository Locator
  locator.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteLocalDataSource: locator()));

  // LocalDataSource Locator
  locator.registerLazySingleton<NoteLocalDataSource>(
      () => NoteLocalDataSourceImpl(notesDatabaseHelper: locator()));

  // Database Locator
  locator.registerLazySingleton(() => NotesDatabaseHelper());
}
