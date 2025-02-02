import 'package:ktnotes/core/arch/domain/model/note.dart';
import 'package:ktnotes/core/base/base_repository.dart';

abstract class NotesRepository implements BaseRepository {
  /// Get notes
  Future<List<Note>> getNotes();

  /// Save note
  Future<void> saveNote({required Note note});

  /// Remove note
  Future<void> removeNote({required String noteId});

  Future<void> signInWithGoogle({required String idToken});

  Future<void> signOut();
}