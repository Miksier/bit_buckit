// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pull_requestDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PullRequestDTO _$PullRequestDTOFromJson(Map<String, dynamic> json) {
  return PullRequestDTO(
    closed: json['closed'] as bool,
    createdDate: json['createdDate'] as int,
    id: json['id'] as int,
    locked: json['locked'] as bool,
    open: json['open'] as bool,
    author: json['author'] == null
        ? null
        : AuthorDTO.fromJson(json['author'] as Map<String, dynamic>),
    properties: json['properties'] == null
        ? null
        : PropertiesDTO.fromJson(json['properties'] as Map<String, dynamic>),
    reviewers: (json['reviewers'] as List)
        ?.map((e) =>
            e == null ? null : ReviewerDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    state: json['state'] as String,
    description: json['description'] as String,
    fromRef: json['fromRef'] == null
        ? null
        : RepoRefDTO.fromJson(json['fromRef'] as Map<String, dynamic>),
    title: json['title'] as String,
    toRef: json['toRef'] == null
        ? null
        : RepoRefDTO.fromJson(json['toRef'] as Map<String, dynamic>),
    updatedDate: json['updatedDate'] as int,
    version: json['version'] as int,
  );
}

Map<String, dynamic> _$PullRequestDTOToJson(PullRequestDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'description': instance.description,
      'title': instance.title,
      'state': instance.state,
      'open': instance.open,
      'closed': instance.closed,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'fromRef': instance.fromRef,
      'toRef': instance.toRef,
      'locked': instance.locked,
      'author': instance.author,
      'reviewers': instance.reviewers,
      'properties': instance.properties,
    };
