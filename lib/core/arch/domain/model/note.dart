import 'package:json/json.dart';
import 'package:ktnotes/core/arch/domain/model/note_details.dart';

@JsonCodable()
class Note {
  final String id;
  final NoteDetails details;
  const Note(this.id, this.details,);
}