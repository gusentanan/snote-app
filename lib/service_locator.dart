import 'package:get_it/get_it.dart';
import 'package:mynotes/data/datasources/db/notes_database_helper.dart';
import 'package:mynotes/data/datasources/note_local_datasource.dart';
import 'package:mynotes/domain/bloc/note_bloc.dart';
import 'package:mynotes/domain/repository/note_repository.dart';
import 'package:mynotes/domain/usecase/delete_note_usecase.dart';
import 'package:mynotes/domain/usecase/get_note_list_usecase.dart';
import 'package:mynotes/domain/usecase/get_single_note_usecase.dart';
import 'package:mynotes/domain/usecase/insert_note_usecase.dart';
import 'package:mynotes/domain/usecase/update_note_usecase.dart';

final locator = GetIt.instance;

void init() {
  // Bloc Locator
  locator.registerFactory(
      () => NoteBloc(locator(), locator(), locator(), locator(), locator()));

  // UseCase Locator
  locator.registerLazySingleton(() => GetNoteListUsecase(locator()));
  locator.registerLazySingleton(() => InsertNoteUsecase(locator()));
  locator.registerLazySingleton(() => GetSingleNoteUsecase(locator()));
  locator.registerLazySingleton(() => DeleteNoteUsecase(locator()));
  locator.registerLazySingleton(() => UpdateNoteUsecase(locator()));

  // Repository Locator
  locator.registerLazySingleton<NoteRepository>(
      () => NoteRepositoryImpl(noteLocalDataSource: locator()));

  // LocalDataSource Locator
  locator.registerLazySingleton<NoteLocalDataSource>(
      () => NoteLocalDataSourceImpl(notesDatabaseHelper: locator()));

  // Database Locator
  locator.registerLazySingleton(() => NotesDatabaseHelper());
}
