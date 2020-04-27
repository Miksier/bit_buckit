// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commitDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitDTO _$CommitDTOFromJson(Map<String, dynamic> json) {
  return CommitDTO(
    id: json['id'] as String,
    author: json['author'] == null
        ? null
        : AuthorDTO.fromJson(json['author'] as Map<String, dynamic>),
    authorTimestamp: json['authorTimestamp'] as String,
    committer: json['committer'] == null
        ? null
        : CommitterDTO.fromJson(json['committer'] as Map<String, dynamic>),
    committerTimestamp: json['committerTimestamp'] as String,
    displayId: json['displayId'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$CommitDTOToJson(CommitDTO instance) => <String, dynamic>{
      'id': instance.id,
      'displayId': instance.displayId,
      'author': instance.author,
      'authorTimestamp': instance.authorTimestamp,
      'committer': instance.committer,
      'committerTimestamp': instance.committerTimestamp,
      'message': instance.message,
    };
