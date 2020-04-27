import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';
import 'authorDTO.dart';
import 'committerDTO.dart';

part 'commitDTO.g.dart';

@JsonSerializable()
class CommitDTO implements JSONParseable{
  String id;
     String displayId;
     AuthorDTO author;
     String authorTimestamp;
     CommitterDTO committer;
     String committerTimestamp;
     String message;
     //List<Parent> parents;


  CommitDTO({this.id, this.author,this.authorTimestamp,this.committer,this.committerTimestamp,this.displayId,this.message});

  factory CommitDTO.fromJson(Map<String, dynamic> json) =>
      _$CommitDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$CommitDTOToJson(this);

  CommitDTO fromJSON(Map<String, dynamic> json) {
    return CommitDTO.fromJson(json);
  }
}