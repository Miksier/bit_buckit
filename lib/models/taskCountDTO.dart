import 'package:bucqit/models/JSONParseable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'taskCountDTO.g.dart';

@JsonSerializable()
class TaskCountDTO extends JSONParseable {
  int open;
  int resolved;

  TaskCountDTO(
      {this.open,this.resolved});
  factory TaskCountDTO.fromJson(Map<String, dynamic> json) =>
      _$TaskCountDTOFromJson(json);
  Map<String, dynamic> toJson() => _$TaskCountDTOToJson(this);

  TaskCountDTO fromJSON(Map<String, dynamic> json) {
    return TaskCountDTO.fromJson(json);
  }
}
