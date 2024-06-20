import 'package:ktnotes/core/arch/domain/service/notes_service.dart';
import 'package:ktnotes/core/base/base_repository.dart';
import 'package:ktnotes/core/di/inject_import.dart';

mixin NotesServiceProvider on BaseRepository {
  NotesService get notesService => injector.get<NotesService>();
}