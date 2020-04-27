// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectDTO _$ProjectDTOFromJson(Map<String, dynamic> json) {
  return ProjectDTO(
    id: json['id'] as int,
    name: json['name'] as String,
    public: json['public'] as bool,
    type: json['type'] as String,
    key: json['key'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$ProjectDTOToJson(ProjectDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'public': instance.public,
      'type': instance.type,
      'key': instance.key,
      'avatarUrl': instance.avatarUrl,
    };
