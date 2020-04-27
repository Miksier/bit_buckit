// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentAnchorDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentAnchorDTO _$CommentAnchorDTOFromJson(Map<String, dynamic> json) {
  return CommentAnchorDTO(
    diffType: json['diffType'] as String,
    fileType: json['fileType'] as String,
    fromHash: json['fromHash'] as String,
    line: json['line'] as int,
    lineType: json['lineType'] as String,
    orphaned: json['orphaned'] as bool,
    path: json['path'] as String,
    toHash: json['toHash'] as String,
  )..srcPath = json['srcPath'] as String;
}

Map<String, dynamic> _$CommentAnchorDTOToJson(CommentAnchorDTO instance) =>
    <String, dynamic>{
      'fromHash': instance.fromHash,
      'toHash': instance.toHash,
      'line': instance.line,
      'lineType': instance.lineType,
      'fileType': instance.fileType,
      'path': instance.path,
      'srcPath': instance.srcPath,
      'diffType': instance.diffType,
      'orphaned': instance.orphaned,
    };
