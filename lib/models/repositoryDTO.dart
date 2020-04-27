import 'package:bucqit/models/JSONParseable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repositoryDTO.g.dart';

@JsonSerializable()
class RepositoryDTO extends JSONParseable{
  String slug;
  int id;
  String name;
  String scmId;
  String state;
  String statusMessage;
  bool forkable;
  bool public;
  String avatarUrl;
 
RepositoryDTO({this.name,this.forkable,this.id,this.public,this.scmId,this.slug,this.state,this.avatarUrl});

factory RepositoryDTO.fromJson(Map<String, dynamic> json) => _$RepositoryDTOFromJson(json);
Map<String, dynamic> toJson() => _$RepositoryDTOToJson(this);

RepositoryDTO fromJSON(Map<String, dynamic> json) {
    return RepositoryDTO.fromJson(json);
}
}