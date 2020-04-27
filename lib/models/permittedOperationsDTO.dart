import 'package:json_annotation/json_annotation.dart';
part 'permittedOperationsDTO.g.dart';

@JsonSerializable()
class PermittedOperationsDTO {
  bool deletable;
  bool editable;
  bool transitionable;

  PermittedOperationsDTO({this.deletable, this.editable, this.transitionable});
  factory PermittedOperationsDTO.fromJson(Map<String, dynamic> json) =>
      _$PermittedOperationsDTOFromJson(json);
  Map<String, dynamic> toJson() => _$PermittedOperationsDTOToJson(this);
}
