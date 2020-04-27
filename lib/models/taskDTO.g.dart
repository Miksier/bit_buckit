// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskDTO _$TaskDTOFromJson(Map<String, dynamic> json) {
  return TaskDTO(
    text: json['text'] as String,
    createdDate: json['createdDate'] as int,
    state: json['state'] as String,
    id: json['id'] as int,
    author: json['author'] == null
        ? null
        : AuthorDTO.fromJson(json['author'] as Map<String, dynamic>),
    anchor: json['anchor'] == null
        ? null
        : TaskAnchorDTO.fromJson(json['anchor'] as Map<String, dynamic>),
    permittedOperations: json['permittedOperations'] == null
        ? null
        : PermittedOperationsDTO.fromJson(
            json['permittedOperations'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TaskDTOToJson(TaskDTO instance) => <String, dynamic>{
      'anchor': instance.anchor,
      'author': instance.author,
      'createdDate': instance.createdDate,
      'id': instance.id,
      'text': instance.text,
      'state': instance.state,
      'permittedOperations': instance.permittedOperations,
    };
