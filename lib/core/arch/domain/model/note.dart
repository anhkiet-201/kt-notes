import 'package:json/json.dart';
import 'package:myapp/core/arch/domain/model/note_details.dart';

@JsonCodable()
class Note {
  final int x;
  final NoteDetails details;
  const Note(this.x, this.details,);
}