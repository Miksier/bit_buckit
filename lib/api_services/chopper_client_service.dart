import 'dart:convert';

import 'package:bucqit/api_services/jira_api_service.dart';
import 'package:bucqit/api_services/projects_api_service.dart';
import 'package:bucqit/api_services/pull_request_api_service.dart';
import 'package:bucqit/api_services/pull_requests_api_service.dart';
import 'package:bucqit/api_services/repositories_api_service.dart';
import 'package:bucqit/api_services/user_api_service.dart';
import 'package:bucqit/api_services/users_api_service.dart';
import 'package:bucqit/config/config.dart';
import 'package:bucqit/db/credentials.dart';
import 'package:bucqit/db/credentials_box.dart';
import 'package:bucqit/models/JSONParseable.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:chopper/chopper.dart';
import 'package:hive/hive.dart';

class ChopperClientService {
  ChopperClient _client;
  ChopperClient get client => _client ?? createClient();
  Box<Credentials> credentialsBox;
  ChopperClientService(CredentialsBox credentials) {
    credentialsBox = credentials.box;
  }
  ChopperClientService.fromBox(Box<Credentials> box) {
    credentialsBox = box;
  }

  Future<List<T>> handleReponse<T extends JSONParseable>(
      Future<Response> request, ItemCreator<T> creator,
      {bool pagedRequest = true}) async {
    try {
      var answer = await request;
      if (answer.isSuccessful) {
        if (pagedRequest) {
          var content =
              ResponseDTO<T>.fromJson(jsonDecode(answer.body), creator);
          return content.values;
        }
        return [creator().fromJSON(jsonDecode(answer.body))];
      } else {
        throw Exception(answer.statusCode);
      }
    } catch (exception) {
      throw Exception(exception.body);
    }
  }

  ChopperClient createClient() {
    final user = credentialsBox.values.first;
    _client = ChopperClient(
      baseUrl: user.url,
      interceptors: [
        HeadersInterceptor({
          'Authorization': user.token,
          'X-Atlassian-Token': 'no-check',
          'Content-Type': 'application/json;charset=UTF-8'
        })
      ],
      services: [
        ProjectsApiService.create(),
        RepositoriesApiService.create(),
        PullRequestsApiService.create(),
        PullRequestApiService.create(),
        UsersApiService.create(),
        UserApiService.create(),
        JiraApiService.create()
      ],
    );
    return _client;
  }
}
