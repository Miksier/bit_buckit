import 'package:bucqit/models/JSONParseable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'userDTO.g.dart';

@JsonSerializable()
class UserDTO extends JSONParseable {
  @JsonKey(includeIfNull: false)
  String name;
  @JsonKey(includeIfNull: false)
  String emailAddress;
  @JsonKey(includeIfNull: false)
  int id;
  @JsonKey(includeIfNull: false)
  String displayName;
  @JsonKey(includeIfNull: false)
  bool active;
  @JsonKey(includeIfNull: false)
  String slug;
  @JsonKey(includeIfNull: false)
  String type;
  @JsonKey(includeIfNull: false)
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
