import 'dart:convert';

import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:chopper/chopper.dart';

class RequestUtils {
  static Future<ResponseDTO> pagedRequest<T extends JSONParseable>(
      Future<Response> request, ItemCreator<T> creator) async {
    try {
      final answer = await request;
      if (answer.isSuccessful) {
        return ResponseDTO<T>.fromJson(jsonDecode(answer.body), creator);
      } else {
        throw Exception(answer.body);
      }
    } catch (e) {
      throw Exception(e.message);
    }
  }

  static Future<T> request<T extends JSONParseable>(
      Future<Response> request, ItemCreator<T> creator,
      {bool pagedRequest = true}) async {
    try {
      final answer = await request;
      if (answer.isSuccessful) {
        return creator().fromJSON(jsonDecode(answer.body));
      } else {
        throw Exception(answer.statusCode);
      }
    } catch (exception) {
      throw Exception(exception.body);
    }
  }

  static Future<List<T>> requestList<T extends JSONParseable>(
      Future<Response> request, ItemCreator<T> creator,
      {bool pagedRequest = true}) async {
    try {
      final answer = await request;
      if (answer.isSuccessful) {
        var json = jsonDecode(answer.body);
        if (json is List<dynamic>) {
          List<T> contents = List<T>();
          for (var item in json) {
            try {
              contents.add(creator().fromJSON(item));
            } catch (e) {
              print(e);
            }
          }
          return contents;
        }
        return creator().fromJSON(jsonDecode(answer.body));
      } else {
        throw Exception(answer.statusCode);
      }
    } catch (exception) {
      throw Exception(exception.body);
    }
  }
}
