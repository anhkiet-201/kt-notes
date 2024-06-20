import 'package:ktnotes/core/arch/domain/model/note.dart';
import 'package:ktnotes/core/arch/domain/repository/repository_provider.dart';
import 'package:ktnotes/core/base/base_usecases.dart';

/// Use case for saving a note.
class SaveNote extends BaseUsecases<Future<void>> with NotesRepositoryProvider {

  /// The note to be saved.
  final Note note;

  /// Creates a [SaveNote] use case with the given [note].
  SaveNote(this.note);

  /// Executes the use case to save the note.
  @override
  Future<void> call() => notesRepository.saveNote(note: note);
}
