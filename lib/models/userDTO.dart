import 'package:bucqit/models/JSONParseable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'userDTO.g.dart';

@JsonSerializable()
class UserDTO extends JSONParseable {
  String name;
  String emailAddress;
  int id;
  String displayName;
  bool active;
  String slug;
  String type;
  String avatarUrl;
  //Links5 links;

  UserDTO(
      {this.id,
      this.name,
      this.type,
      this.active,
      this.displayName,
      this.emailAddress,
      this.slug,
      this.avatarUrl});
  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);
  Map<String, dynamic> toJson() => _$UserDTOToJson(this);

  UserDTO fromJSON(Map<String, dynamic> json) {
    return UserDTO.fromJson(json);
  }
}
