import 'package:json_annotation/json_annotation.dart';

part 'mergeResultDTO.g.dart';

@JsonSerializable()
class MergeResultDTO {
  String outcome;
  bool current;

  MergeResultDTO({this.current, this.outcome});

  factory MergeResultDTO.fromJson(Map<String, dynamic> json) =>
      _$MergeResultDTOFromJson(json);
  Map<String, dynamic> toJson() => _$MergeResultDTOToJson(this);

  MergeResultDTO fromJSON(Map<String, dynamic> json) {
    return MergeResultDTO.fromJson(json);
  }
}
