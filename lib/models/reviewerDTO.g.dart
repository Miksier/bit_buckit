// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewerDTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewerDTO _$ReviewerDTOFromJson(Map<String, dynamic> json) {
  return ReviewerDTO(
    user: json['user'] == null
        ? null
        : UserDTO.fromJson(json['user'] as Map<String, dynamic>),
    status: json['status'] as String,
    role: json['role'] as String,
    approved: json['approved'] as bool,
    lastReviewedCommit: json['lastReviewedCommit'] as String,
  );
}

Map<String, dynamic> _$ReviewerDTOToJson(ReviewerDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user', instance.user);
  writeNotNull('lastReviewedCommit', instance.lastReviewedCommit);
  writeNotNull('role', instance.role);
  writeNotNull('approved', instance.approved);
  writeNotNull('status', instance.status);
  return val;
}
