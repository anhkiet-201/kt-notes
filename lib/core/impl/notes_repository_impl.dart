import 'package:ktnotes/core/arch/domain/model/note.dart';
import 'package:ktnotes/core/arch/domain/repository/notes_repository.dart';
import 'package:ktnotes/core/arch/domain/service/service_provider.dart';

/// {@template notes_repository_impl}
/// Implementation of [NotesRepository].
/// {@endtemplate}
class NotesRepositoryImpl extends NotesRepository with NotesServiceProvider{
  /// {@macro notes_repository_impl}
  NotesRepositoryImpl();

  /// {@template notes_repository_impl_get_notes}
  /// See [NotesRepository.getNotes].
  /// {@endtemplate}
  @override
  Future<List<Note>> getNotes() => notesService.getNotes();

  /// {@template notes_repository_impl_remove_note}
  /// See [NotesRepository.removeNote].
  /// {@endtemplate}
  @override
  Future<void> removeNote({required String noteId}) => notesService.removeNote(noteId: noteId);

  /// {@template notes_repository_impl_save_note}
  /// See [NotesRepository.saveNote].
  /// {@endtemplate}
  @override
  Future<void> saveNote({required Note note}) => notesService.saveNote(note: note);
  
  @override
  Future<void> signInWithGoogle({required String idToken}) => notesService.signInWithGoogle(idToken: idToken);
  
  @override
  Future<void> signOut() => notesService.signOut();
}
