// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committerDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitterDTO _$CommitterDTOFromJson(Map<String, dynamic> json) {
  return CommitterDTO(
    id: json['id'] as int,
    active: json['active'] as bool,
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$CommitterDTOToJson(CommitterDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'emailAddress': instance.emailAddress,
      'id': instance.id,
      'displayName': instance.displayName,
      'active': instance.active,
      'slug': instance.slug,
      'type': instance.type,
    };
