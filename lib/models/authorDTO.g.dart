// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorDTO _$AuthorDTOFromJson(Map<String, dynamic> json) {
  return AuthorDTO(
    approved: json['approved'] as bool,
    role: json['role'] as String,
    status: json['status'] as String,
    user: json['user'] == null
        ? null
        : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorDTOToJson(AuthorDTO instance) => <String, dynamic>{
      'user': instance.user,
      'role': instance.role,
      'approved': instance.approved,
      'status': instance.status,
    };
