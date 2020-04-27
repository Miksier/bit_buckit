// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDTO _$UserDTOFromJson(Map<String, dynamic> json) {
  return UserDTO(
    id: json['id'] as int,
    name: json['name'] as String,
    type: json['type'] as String,
    active: json['active'] as bool,
    displayName: json['displayName'] as String,
    emailAddress: json['emailAddress'] as String,
    slug: json['slug'] as String,
    avatarUrl: json['avatarUrl'] as String,
  );
}

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) => <String, dynamic>{
      'name': instance.name,
      'emailAddress': instance.emailAddress,
      'id': instance.id,
      'displayName': instance.displayName,
      'active': instance.active,
      'slug': instance.slug,
      'type': instance.type,
      'avatarUrl': instance.avatarUrl,
    };
