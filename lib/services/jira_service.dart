import 'package:bucqit/api_services/jira_api_service.dart';
import 'package:bucqit/models/issueDTO.dart';
import 'package:bucqit/utils/request_utils.dart';

class JiraService {
  final JiraApiService _service;

  JiraService(this._service);

  Future<List<IssueDTO>> getIssues(String projectKey, String repositorrySlug,
      String pullRequestId, int limit, int start) async {
    try {
      return RequestUtils.requestList<IssueDTO>(
          _service.getPullRequestIssues(
              projectKey, repositorrySlug, pullRequestId,
              limit: limit, start: start),
          () => IssueDTO());
    } catch (e) {
      print(e);
      return List<IssueDTO>();
    }
  }
}
