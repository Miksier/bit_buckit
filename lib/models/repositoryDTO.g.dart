// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositoryDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoryDTO _$RepositoryDTOFromJson(Map<String, dynamic> json) {
  return RepositoryDTO(
    name: json['name'] as String,
    forkable: json['forkable'] as bool,
    id: json['id'] as int,
    public: json['public'] as bool,
    scmId: json['scmId'] as String,
    slug: json['slug'] as String,
    state: json['state'] as String,
    avatarUrl: json['avatarUrl'] as String,
  )..statusMessage = json['statusMessage'] as String;
}

Map<String, dynamic> _$RepositoryDTOToJson(RepositoryDTO instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'id': instance.id,
      'name': instance.name,
      'scmId': instance.scmId,
      'state': instance.state,
      'statusMessage': instance.statusMessage,
      'forkable': instance.forkable,
      'public': instance.public,
      'avatarUrl': instance.avatarUrl,
    };
