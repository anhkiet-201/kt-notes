import 'package:ktnotes/core/arch/domain/repository/notes_repository.dart';
import 'package:ktnotes/core/base/base_usecases.dart';
import 'package:ktnotes/core/di/inject_import.dart';

mixin NotesRepositoryProvider<T> on BaseUsecases<T> {
  NotesRepository get notesRepository => injector.get<NotesRepository>();
}