import 'dart:convert';

import 'package:bucqit/api_services/pull_request_api_service.dart';
import 'package:bucqit/models/commentDTO.dart';

class CommentService{
   final PullRequestApiService _service;

  CommentService(this._service);

  Future<bool> postComment(String _projectId,String _repositorySlug,String _pullRequestId, CommentDTO comment) async {
      try {
         await _service.addComment(_projectId, _repositorySlug, _pullRequestId,
          jsonEncode(comment.toJson()));
          return true;
      } catch (e) {
        return false;
      }
     
  }
}