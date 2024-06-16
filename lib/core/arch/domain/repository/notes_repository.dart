import 'package:myapp/core/arch/domain/model/note.dart';
import 'package:myapp/core/base/base_repository.dart';

abstract class NotesRepository implements BaseRepository {
  Future<List<Note>> getNotes();

  Future<void> saveNote();

  Future<void> removeNote();
}