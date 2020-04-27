// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pullRequestActionDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PullRequestActionDTO _$PullRequestActionDTOFromJson(Map<String, dynamic> json) {
  return PullRequestActionDTO(
    createdDate: json['createdDate'] as int,
    fromHash: json['fromHash'] as String,
    toHash: json['toHash'] as String,
    action: json['action'] as String,
    addedReviewers: (json['addedReviewers'] as List)
        ?.map((e) =>
            e == null ? null : UserDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comment: json['comment'] == null
        ? null
        : CommentDTO.fromJson(json['comment'] as Map<String, dynamic>),
    commentAction: json['commentAction'] as String,
    id: json['id'] as int,
    previousFromHash: json['previousFromHash'] as String,
    previousToHash: json['previousToHash'] as String,
    removed: json['removed'] == null
        ? null
        : RescopedCommitsDTO.fromJson(json['removed'] as Map<String, dynamic>),
    removedReviewers: (json['removedReviewers'] as List)
        ?.map((e) =>
            e == null ? null : UserDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    user: json['user'] == null
        ? null
        : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
  )
    ..added = json['added'] == null
        ? null
        : RescopedCommitsDTO.fromJson(json['added'] as Map<String, dynamic>)
    ..commentAnchor = json['commentAnchor'] == null
        ? null
        : CommentAnchorDTO.fromJson(
            json['commentAnchor'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PullRequestActionDTOToJson(
        PullRequestActionDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdDate': instance.createdDate,
      'user': instance.user,
      'action': instance.action,
      'fromHash': instance.fromHash,
      'previousFromHash': instance.previousFromHash,
      'previousToHash': instance.previousToHash,
      'toHash': instance.toHash,
      'added': instance.added,
      'removed': instance.removed,
      'commentAction': instance.commentAction,
      'comment': instance.comment,
      'commentAnchor': instance.commentAnchor,
      'addedReviewers': instance.addedReviewers,
      'removedReviewers': instance.removedReviewers,
    };
