import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'commentAnchorDTO.g.dart';

@JsonSerializable()
class CommentAnchorDTO implements JSONParseable{
  String fromHash;
  String toHash;
  int line;
  String lineType;
  String fileType;
  String path;
    String srcPath;
  String diffType;
  bool orphaned;


  CommentAnchorDTO({this.diffType,this.fileType,this.fromHash,this.line,this.lineType,this.orphaned,this.path,this.toHash});

  factory CommentAnchorDTO.fromJson(Map<String, dynamic> json) =>
      _$CommentAnchorDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$CommentAnchorDTOToJson(this);

  CommentAnchorDTO fromJSON(Map<String, dynamic> json) {
    return CommentAnchorDTO.fromJson(json);
  }
}