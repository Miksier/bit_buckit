import 'package:bucqit/api_services/repositories_api_service.dart';
import 'package:bucqit/models/repositoryDTO.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:bucqit/utils/request_utils.dart';

class RepositoryService {
  final RepositoriesApiService _service;

  RepositoryService(this._service);

  Future<ResponseDTO> getRepositories(String projectKey,
      {int limit = 25, int start = 0}) async {
    try {
      return await RequestUtils.pagedRequest<RepositoryDTO>(
          _service.getRepositories(projectKey, limit: limit, start: start),
          () => RepositoryDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }
}
