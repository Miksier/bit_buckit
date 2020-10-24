import 'package:bucqit/models/authorDTO.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/models/reviewerDTO.dart';
import 'package:bucqit/models/taskDTO.dart';
import 'package:bucqit/models/ui/pr_ownership.dart';
import 'package:bucqit/models/ui/pr_state.dart';

import '../issueDTO.dart';

class PullRequestModel {
  PrMergeState mergeState;
  PrBuildState buildState;
  PrOwnership ownership;
  AuthorDTO author;
  List<ReviewerDTO> reviewers = [];
  List<PullRequestActionDTO> activities = [];
  List<TaskDTO> tasks = [];
  List<IssueDTO> issues = [];
  int activeTasks;
  String description = "";
  bool hasApproved;
}
