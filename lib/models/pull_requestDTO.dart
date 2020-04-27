import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/authorDTO.dart';
import 'package:bucqit/models/repoRefDTO.dart';
import 'package:bucqit/models/reviewerDTO.dart';
import 'package:bucqit/models/propertiesDTO.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pull_requestDTO.g.dart';

@JsonSerializable()
class PullRequestDTO implements JSONParseable {
  int id;
  int version;
  String description;
  String title;
  String state;
  bool open;
  bool closed;
  int createdDate;
  int updatedDate;
  RepoRefDTO fromRef;
  RepoRefDTO toRef;
  bool locked;
  AuthorDTO author;
  List<ReviewerDTO> reviewers;
  // List<Participant> participants
  PropertiesDTO properties;
  // Links8 links

  PullRequestDTO(
      {this.closed,
      this.createdDate,
      this.id,
      this.locked,
      this.open,
      this.author,
      this.properties,
      this.reviewers,
      this.state,
      this.description,
      this.fromRef,
      this.title,
      this.toRef,
      this.updatedDate,
      this.version});

  PullRequestDTO fromJSON(Map<String, dynamic> json) {
    return PullRequestDTO.fromJson(json);
  }

  factory PullRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$PullRequestDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PullRequestDTOToJson(this);
}
