import 'package:ktnotes/core/arch/domain/repository/repository_provider.dart';
import 'package:ktnotes/core/base/base_usecases.dart';

/// Use case for removing a note.
class RemoveNote extends BaseUsecases<Future<void>> with NotesRepositoryProvider {
  /// The ID of the note to be removed.
  final String noteId;

  /// Creates a [RemoveNote] use case with the given [noteId].
  RemoveNote(this.noteId);

  /// Executes the use case to remove the note.
  @override
  Future<void> call() => notesRepository.removeNote(noteId: noteId);
}
