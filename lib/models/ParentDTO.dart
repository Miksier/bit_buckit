import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';
part 'ParentDTO.g.dart';

@JsonSerializable()
class ParentDTO implements JSONParseable {
  int id;
  ParentDTO({this.id});
  factory ParentDTO.fromJson(Map<String, dynamic> json) =>
      _$ParentDTOFromJson(json);
  Map<String, dynamic> toJson() => _$ParentDTOToJson(this);

  ParentDTO fromJSON(Map<String, dynamic> json) {
    return ParentDTO.fromJson(json);
  }
}
