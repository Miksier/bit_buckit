import 'package:bucqit/models/userDTO.dart';
import 'package:json_annotation/json_annotation.dart';
part 'authorDTO.g.dart';

@JsonSerializable()
class AuthorDTO {
  UserDTO user;
  String role;
  bool approved;
  String status;

  AuthorDTO({this.approved, this.role, this.status, this.user});

  factory AuthorDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorDTOFromJson(json);
  Map<String, dynamic> toJson() => _$AuthorDTOToJson(this);
}
