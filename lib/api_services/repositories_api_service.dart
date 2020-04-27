import "dart:async";
import 'package:chopper/chopper.dart';

part "repositories_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/api/1.0/projects")
abstract class RepositoriesApiService extends ChopperService {
  static RepositoriesApiService create([ChopperClient client]) =>
      _$RepositoriesApiService(client);

  @Get(path: '/{projectKey}/repos')
  Future<Response> getRepositories(@Path() String projectKey,
      {@Query("limit") int limit = 25, @Query("start") int start = 0});
}
