import 'package:bucqit/models/commentAnchorDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/models/userDTO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';
import 'ParentDTO.dart';
part 'commentDTO.g.dart';

@JsonSerializable()
class CommentDTO implements JSONParseable {
  //Properties properties;
  @JsonKey(includeIfNull: false)
  int id;
  @JsonKey(includeIfNull: false)
  int version;
  @JsonKey(includeIfNull: false)
  String text;
  @JsonKey(includeIfNull: false)
  UserDTO author;
  @JsonKey(includeIfNull: false)
  int createdDate;
  @JsonKey(includeIfNull: false)
  int updatedDate;
  @JsonKey(includeIfNull: false)
  List<CommentDTO> comments;
  @JsonKey(includeIfNull: false)
  ParentDTO parent;
  @JsonKey(includeIfNull: false)
  CommentAnchorDTO anchorDTO;
  @JsonKey(includeIfNull: false)
  List<TaskDTO> tasks;
  //PermittedOperations permittedOperations;

  CommentDTO(
      {this.id,
      this.author,
      this.comments,
      this.createdDate,
      this.text,
      this.updatedDate,
      this.version,
      this.parent,
      this.anchorDTO});

  factory CommentDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$CommentDTOToJson(this);

  CommentDTO fromJSON(Map<String, dynamic> json) {
    return CommentDTO.fromJson(json);
  }
}
