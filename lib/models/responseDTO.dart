import 'package:bucqit/config/config.dart';

import 'JSONParseable.dart';

class ResponseDTO<T extends JSONParseable> {
  ItemCreator<T> creator;
  final int size;
  final int limit;
  final bool isLastPage;
  final List<T> values;

  ResponseDTO({this.isLastPage, this.limit, this.size, this.values});

  factory ResponseDTO.fromJson(
      Map<String, dynamic> json, ItemCreator<T> creator) {
    List<T> contents = List<T>();
    for (var item in json['values'] as List<dynamic>) {
      try {
        contents.add(creator().fromJSON(item));
      } catch (e) {
        print(e);
      }
    }
    return ResponseDTO(
      isLastPage: json['isLastPage'] as bool,
      limit: json['limit'] as int,
      size: json['size'] as int,
      values: contents,
    );
  }
  
  Map<String, dynamic> toJson() => _$ResponseDTOToJson(this);

  Map<String, dynamic> _$ResponseDTOToJson(ResponseDTO instance) =>
      <String, dynamic>{
        'size': instance.size,
        'limit': instance.limit,
        'isLastPage': instance.isLastPage,
        'values': instance.values,
      };
}
