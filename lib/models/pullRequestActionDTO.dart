import 'package:bucqit/models/commentAnchorDTO.dart';
import 'package:bucqit/models/commentDTO.dart';
import 'package:bucqit/models/rescopedCommitsDTO.dart';
import 'package:bucqit/models/userDTO.dart';

import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'pullRequestActionDTO.g.dart';

@JsonSerializable()
class PullRequestActionDTO implements JSONParseable{
   int id;
     int createdDate;
     UserDTO user;
     String action;
     String fromHash;
     String previousFromHash;
     String previousToHash;
     String toHash;
     RescopedCommitsDTO added;
     RescopedCommitsDTO removed;
     String commentAction;
     CommentDTO comment;
     CommentAnchorDTO commentAnchor;
    // Diff diff;
     List<UserDTO> addedReviewers;
     List<UserDTO> removedReviewers;


  PullRequestActionDTO({this.createdDate,this.fromHash,this.toHash,this.action,this.addedReviewers,this.comment,this.commentAction,this.id,this.previousFromHash,this.previousToHash,this.removed,this.removedReviewers,this.user});

  factory PullRequestActionDTO.fromJson(Map<String, dynamic> json) =>
      _$PullRequestActionDTOFromJson(json);
      
  Map<String, dynamic> toJson() => _$PullRequestActionDTOToJson(this);

  PullRequestActionDTO fromJSON(Map<String, dynamic> json) {
    return PullRequestActionDTO.fromJson(json);
  }
}