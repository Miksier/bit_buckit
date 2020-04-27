// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskAnchorDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskAnchorDTO _$TaskAnchorDTOFromJson(Map<String, dynamic> json) {
  return TaskAnchorDTO(
    author: json['author'] == null
        ? null
        : AuthorDTO.fromJson(json['author'] as Map<String, dynamic>),
    id: json['id'] as int,
    state: json['state'] as String,
    updatedDate: json['updatedDate'] as int,
    version: json['version'] as int,
    createdDate: json['createdDate'] as int,
    severity: json['severity'] as String,
    text: json['text'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$TaskAnchorDTOToJson(TaskAnchorDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'text': instance.text,
      'author': instance.author,
      'createdDate': instance.createdDate,
      'updatedDate': instance.updatedDate,
      'severity': instance.severity,
      'state': instance.state,
      'type': instance.type,
    };
