import 'dart:async';
import 'package:bucqit/api_services/chopper_client_service.dart';
import 'package:bucqit/api_services/pull_requests_api_service.dart';
import 'package:bucqit/models/pull_requestDTO.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:equatable/equatable.dart';

part 'repository_event.dart';
part 'repository_state.dart';

class RepositoryBloc extends BaseBloc<RepositoryEvent> {
  PullRequestsApiService _service;
ChopperClientService client;
  RepositoryBloc(ChopperClientService client) : super() {
    this.client = client;
    _service = client.client.getService<PullRequestsApiService>();
  }

  @override
  internalMapEventToState(RepositoryEvent event) async* {
    if (event is LoadPullRequest) {
      var prs = await client.handleReponse(
          _service.getPullRequests(
              event.projectKey, event.repositorySlug),
          () => PullRequestDTO());
      yield BlocLoadedState(data: prs);
    }
  }

  // Future getPRs(ProjectsService todosService, LoadRepositories event,
  //     ResponseDTO<RepositoryDTO> a) async {}
}
