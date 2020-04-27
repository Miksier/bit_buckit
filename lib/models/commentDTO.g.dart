// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commentDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentDTO _$CommentDTOFromJson(Map<String, dynamic> json) {
  return CommentDTO(
    id: json['id'] as int,
    author: json['author'] == null
        ? null
        : UserDTO.fromJson(json['author'] as Map<String, dynamic>),
    comments: (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : CommentDTO.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdDate: json['createdDate'] as int,
    text: json['text'] as String,
    updatedDate: json['updatedDate'] as int,
    version: json['version'] as int,
    parent: json['parent'] == null
        ? null
        : ParentDTO.fromJson(json['parent'] as Map<String, dynamic>),
    anchorDTO: json['anchorDTO'] == null
        ? null
        : CommentAnchorDTO.fromJson(json['anchorDTO'] as Map<String, dynamic>),
  )..tasks = (json['tasks'] as List)
      ?.map(
          (e) => e == null ? null : TaskDTO.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$CommentDTOToJson(CommentDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('version', instance.version);
  writeNotNull('text', instance.text);
  writeNotNull('author', instance.author);
  writeNotNull('createdDate', instance.createdDate);
  writeNotNull('updatedDate', instance.updatedDate);
  writeNotNull('comments', instance.comments);
  writeNotNull('parent', instance.parent);
  writeNotNull('anchorDTO', instance.anchorDTO);
  writeNotNull('tasks', instance.tasks);
  return val;
}
