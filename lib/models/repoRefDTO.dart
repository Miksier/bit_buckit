import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'repoRefDTO.g.dart';

@JsonSerializable()
class RepoRefDTO implements JSONParseable{
  String id;
     String displayId;


  RepoRefDTO({this.id, this.displayId});

  factory RepoRefDTO.fromJson(Map<String, dynamic> json) =>
      _$RepoRefDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$RepoRefDTOToJson(this);

  RepoRefDTO fromJSON(Map<String, dynamic> json) {
    return RepoRefDTO.fromJson(json);
  }
}