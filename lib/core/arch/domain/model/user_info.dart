
import 'package:json/json.dart';

@JsonCodable()
class UserInfo {
  final String uid;
  final String email;
  final String name;
  final String photoUrl;

  const UserInfo({
    required this.uid,
    required this.email,
    required this.name,
    required this.photoUrl,
  });
}