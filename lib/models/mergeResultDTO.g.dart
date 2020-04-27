// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mergeResultDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MergeResultDTO _$MergeResultDTOFromJson(Map<String, dynamic> json) {
  return MergeResultDTO(
    current: json['current'] as bool,
    outcome: json['outcome'] as String,
  );
}

Map<String, dynamic> _$MergeResultDTOToJson(MergeResultDTO instance) =>
    <String, dynamic>{
      'outcome': instance.outcome,
      'current': instance.current,
    };
