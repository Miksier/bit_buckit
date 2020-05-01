import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/userDTO.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reviewerDTO.g.dart';

@JsonSerializable()
class ReviewerDTO extends JSONParseable {
  @JsonKey(includeIfNull: false)
  UserDTO user;
  @JsonKey(includeIfNull: false)
  String lastReviewedCommit;
  @JsonKey(includeIfNull: false)
  String role;
  @JsonKey(includeIfNull: false)
  bool approved;
  @JsonKey(includeIfNull: false)
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
