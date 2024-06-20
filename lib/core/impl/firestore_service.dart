import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ktnotes/core/arch/domain/model/note.dart';
import 'package:ktnotes/core/arch/domain/service/notes_service.dart';
import 'package:ktnotes/core/logger/logger.dart';

class FireStoreNotesService extends NotesService {

  /// Instance of Firestore used for database interactions.
  final _store = FirebaseFirestore.instance;

  /// Reference to the 'Notes' collection in Firestore, with a converter
  /// to handle data mapping between Firestore documents and [Note] objects.
  /// 
  CollectionReference<Note> get _noteCollection =>
      _store.collection('Notes').withConverter(
          fromFirestore: (snapshot, _) => Note.fromJson(snapshot.data()!),
          toFirestore: (note, _) => note.toJson());

  /// Retrieves all notes from the 'Notes' collection.
  ///
  /// Returns a list of [Note] objects representing the fetched notes.
  @override
  Future<List<Note>> getNotes() async {
    try {
      final snapshot = await _noteCollection.get();
      return snapshot.docs.map((e) => e.data()).toList();
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  /// Removes a note with the given [noteId] from the 'Notes' collection.
  @override
  Future<void> removeNote({required String noteId}) async {
    try {
      await _noteCollection.doc(noteId).delete();
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }

  /// Saves or updates a [note] in the 'Notes' collection.
  ///
  /// Uses [SetOptions(merge: true)] to update existing fields without
  /// overwriting the entire document.
  @override
  Future<void> saveNote({required Note note}) async {
    try {
      await _noteCollection.doc(note.id).set(note, SetOptions(merge: true));
    } catch (e) {
      log.e(e);
      rethrow;
    }
  }
  
  /// Sign in with Google account.
  @override
  Future<void> signInWithGoogle({required String idToken}) {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
  
  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
