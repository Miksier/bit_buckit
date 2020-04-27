// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertiesDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertiesDTO _$PropertiesDTOFromJson(Map<String, dynamic> json) {
  return PropertiesDTO(
    commentCount: json['commentCount'] as int,
    mergeResult: json['mergeResult'] == null
        ? null
        : MergeResultDTO.fromJson(json['mergeResult'] as Map<String, dynamic>),
    openTaskCount: json['openTaskCount'] as int,
    resolvedTaskCount: json['resolvedTaskCount'] as int,
  );
}

Map<String, dynamic> _$PropertiesDTOToJson(PropertiesDTO instance) =>
    <String, dynamic>{
      'mergeResult': instance.mergeResult,
      'resolvedTaskCount': instance.resolvedTaskCount,
      'openTaskCount': instance.openTaskCount,
      'commentCount': instance.commentCount,
    };
