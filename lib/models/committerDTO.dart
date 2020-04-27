import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'committerDTO.g.dart';

@JsonSerializable()
class CommitterDTO implements JSONParseable{
   String name;
     String emailAddress;
     int id;
     String displayName;
     bool active;
     String slug;
     String type;
     //Links3 links;


  CommitterDTO({this.id, this.active,this.displayName,this.emailAddress,this.name,this.slug,this.type});

  factory CommitterDTO.fromJson(Map<String, dynamic> json) =>
      _$CommitterDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$CommitterDTOToJson(this);

  CommitterDTO fromJSON(Map<String, dynamic> json) {
    return CommitterDTO.fromJson(json);
  }
}