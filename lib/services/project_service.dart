import 'package:bucqit/api_services/projects_api_service.dart';
import 'package:bucqit/models/projectDTO.dart';
import 'package:bucqit/models/responseDTO.dart';
import 'package:bucqit/utils/convert_utils.dart';

class ProjectService {
  final ProjectsApiService _service;

  ProjectService(this._service);

  Future<ResponseDTO> getProjects(int limit, int start) async {
    try {
      return ConvertUtil.pagedRequest<ProjectDTO>(
          _service.getProjects(limit: limit, start: start), () => ProjectDTO());
    } catch (e) {
      print(e);
      return ResponseDTO();
    }
  }
}
