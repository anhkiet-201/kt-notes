
import 'package:json/json.dart';

@JsonCodable()
class NoteDetails {
  final String l;
  const NoteDetails(this.l);
}