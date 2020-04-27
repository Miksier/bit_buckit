import 'package:bucqit/models/authorDTO.dart';
import 'package:json_annotation/json_annotation.dart';
part 'taskAnchorDTO.g.dart';

@JsonSerializable()
class TaskAnchorDTO {
  int id;
  int version;
  String text;
  AuthorDTO author;
  int createdDate;
  int updatedDate;
  String severity;
  String state;
  String type;

  TaskAnchorDTO(
      {this.author,
      this.id,
      this.state,
      this.updatedDate,
      this.version,
      this.createdDate,
      this.severity,
      this.text,
      this.type});
  factory TaskAnchorDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskAnchorDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskAnchorDTOToJson(this);
}
