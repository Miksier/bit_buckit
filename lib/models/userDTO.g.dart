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

Map<String, dynamic> _$UserDTOToJson(UserDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('emailAddress', instance.emailAddress);
  writeNotNull('id', instance.id);
  writeNotNull('displayName', instance.displayName);
  writeNotNull('active', instance.active);
  writeNotNull('slug', instance.slug);
  writeNotNull('type', instance.type);
  writeNotNull('avatarUrl', instance.avatarUrl);
  return val;
}
