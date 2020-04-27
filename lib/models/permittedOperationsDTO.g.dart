// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permittedOperationsDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermittedOperationsDTO _$PermittedOperationsDTOFromJson(
    Map<String, dynamic> json) {
  return PermittedOperationsDTO(
    deletable: json['deletable'] as bool,
    editable: json['editable'] as bool,
    transitionable: json['transitionable'] as bool,
  );
}

Map<String, dynamic> _$PermittedOperationsDTOToJson(
        PermittedOperationsDTO instance) =>
    <String, dynamic>{
      'deletable': instance.deletable,
      'editable': instance.editable,
      'transitionable': instance.transitionable,
    };
