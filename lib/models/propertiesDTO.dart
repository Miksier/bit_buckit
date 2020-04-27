import 'package:json_annotation/json_annotation.dart';

import 'mergeResultDTO.dart';

part 'propertiesDTO.g.dart';

@JsonSerializable()
class PropertiesDTO {
  MergeResultDTO mergeResult;
  int resolvedTaskCount;
  int openTaskCount;
  int commentCount;

  PropertiesDTO(
      {this.commentCount,
      this.mergeResult,
      this.openTaskCount,
      this.resolvedTaskCount});

  factory PropertiesDTO.fromJson(Map<String, dynamic> json) =>
      _$PropertiesDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PropertiesDTOToJson(this);

  PropertiesDTO fromJSON(Map<String, dynamic> json) {
    return PropertiesDTO.fromJson(json);
  }
}
