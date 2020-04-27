// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rescopedCommitsDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RescopedCommitsDTO _$RescopedCommitsDTOFromJson(Map<String, dynamic> json) {
  return RescopedCommitsDTO(
    commits: (json['commits'] as List)
        ?.map((e) =>
            e == null ? null : CommentDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    total: json['total'] as int,
  );
}

Map<String, dynamic> _$RescopedCommitsDTOToJson(RescopedCommitsDTO instance) =>
    <String, dynamic>{
      'commits': instance.commits,
      'total': instance.total,
    };
