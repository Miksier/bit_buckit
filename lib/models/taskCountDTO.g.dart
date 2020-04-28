// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskCountDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskCountDTO _$TaskCountDTOFromJson(Map<String, dynamic> json) {
  return TaskCountDTO(
    open: json['open'] as int,
    resolved: json['resolved'] as int,
  );
}

Map<String, dynamic> _$TaskCountDTOToJson(TaskCountDTO instance) =>
    <String, dynamic>{
      'open': instance.open,
      'resolved': instance.resolved,
    };
