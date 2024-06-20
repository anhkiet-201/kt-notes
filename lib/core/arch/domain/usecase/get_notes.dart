import 'dart:async';

import 'package:ktnotes/core/arch/domain/model/note.dart';
import 'package:ktnotes/core/arch/domain/repository/repository_provider.dart';
import 'package:ktnotes/core/base/base_usecases.dart';

class GetNotes extends BaseUsecases<Future<List<Note>>> with NotesRepositoryProvider {
  @override
  Future<List<Note>> call() => notesRepository.getNotes();
}