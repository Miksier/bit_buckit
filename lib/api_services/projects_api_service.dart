import "dart:async";
import 'package:chopper/chopper.dart';

part "projects_api_service.chopper.dart";

@ChopperApi(baseUrl: "/rest/api/1.0/projects")
abstract class ProjectsApiService extends ChopperService {
  static ProjectsApiService create([ChopperClient client]) =>
      _$ProjectsApiService(client);

  @Get()
  Future<Response> getProjects(
      {@Query("limit") int limit = 25, @Query("start") int start = 0,@Query("avatarSize") int avatarSize=64});
}
