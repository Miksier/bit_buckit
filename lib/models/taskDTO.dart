import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/permittedOperationsDTO.dart';
import 'package:bucqit/models/taskAnchorDTO.dart';
import 'package:json_annotation/json_annotation.dart';

import 'authorDTO.dart';
part 'taskDTO.g.dart';

@JsonSerializable()
class TaskDTO extends JSONParseable {
  TaskAnchorDTO anchor;
  AuthorDTO author;
  int createdDate;
  int id;
  String text;
  String state;
  PermittedOperationsDTO permittedOperations;

  TaskDTO(
      {this.text,
      this.createdDate,
      this.state,
      this.id,
      this.author,
      this.anchor,
      this.permittedOperations});
  factory TaskDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskDTOToJson(this);

   TaskDTO fromJSON(Map<String, dynamic> json) {
    return TaskDTO.fromJson(json);
  }
}
