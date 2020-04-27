import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'projectDTO.g.dart';

@JsonSerializable()
class ProjectDTO implements JSONParseable{
  int id;
  String name;
  bool public;
  String type;
  String key;
  String avatarUrl;

  ProjectDTO({this.id, this.name, this.public, this.type, this.key,this.avatarUrl});

  factory ProjectDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);

  ProjectDTO fromJSON(Map<String, dynamic> json) {
    return ProjectDTO.fromJson(json);
  }
}
