import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/userDTO.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reviewerDTO.g.dart';

@JsonSerializable()
class ReviewerDTO extends JSONParseable {
  UserDTO user;
  String lastReviewedCommit;
  String role;
  bool approved;
  String status;

  ReviewerDTO(
      {this.user,
      this.status,
      this.role,
      this.approved,
      this.lastReviewedCommit});

  factory ReviewerDTO.fromJson(Map<String, dynamic> json) =>
      _$ReviewerDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewerDTOToJson(this);

  ReviewerDTO fromJSON(Map<String, dynamic> json) {
    return ReviewerDTO.fromJson(json);
  }
}
