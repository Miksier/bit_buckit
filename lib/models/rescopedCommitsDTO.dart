import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';
import 'commentDTO.dart';

part 'rescopedCommitsDTO.g.dart';

@JsonSerializable()
class RescopedCommitsDTO implements JSONParseable{
  List<CommentDTO> commits;
     int total;


  RescopedCommitsDTO({this.commits,this.total});

  factory RescopedCommitsDTO.fromJson(Map<String, dynamic> json) =>
      _$RescopedCommitsDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$RescopedCommitsDTOToJson(this);

  RescopedCommitsDTO fromJSON(Map<String, dynamic> json) {
    return RescopedCommitsDTO.fromJson(json);
  }
}