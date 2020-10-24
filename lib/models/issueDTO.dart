import 'package:json_annotation/json_annotation.dart';

import 'JSONParseable.dart';

part 'issueDTO.g.dart';

@JsonSerializable()
class IssueDTO implements JSONParseable {
  String key;
  String url;

  IssueDTO({this.key, this.url});

  factory IssueDTO.fromJson(Map<String, dynamic> json) =>
      _$IssueDTOFromJson(json);
  Map<String, dynamic> toJson() => _$IssueDTOToJson(this);

  IssueDTO fromJSON(Map<String, dynamic> json) {
    return IssueDTO.fromJson(json);
  }
}
