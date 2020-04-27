import 'package:bucqit/ui/Repository/PullRequests/widgets/pull_request_tile.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:bucqit/ui/Widgets/infinite_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'bloc/pull_requests_bloc.dart';

class PullRequestsScreen extends StatefulWidget {
  const PullRequestsScreen({Key key, this.projectName, this.repositorySlug})
      : super(key: key);

  final String projectName;
  final String repositorySlug;

  @override
  _PullRequestsScreenState createState() => _PullRequestsScreenState();
}

class _PullRequestsScreenState extends State<PullRequestsScreen> {
  PullRequestsBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = PullRequestsBloc(Provider.of(context));
      _bloc.add(LoadPullRequests(
          projectKey: widget.projectName,
          repositorySlug: widget.repositorySlug));
    }
    return buildBody();
  }

  Widget buildBody() {
    return BlocBuilder(
        bloc: _bloc,
        builder: (c, state) {
          if (state is BlocLoadedState) {
            return RefreshIndicator(
                onRefresh: () async {
                  _bloc.add(LoadPullRequests(
                      projectKey: widget.projectName,
                      repositorySlug: widget.repositorySlug));
                },
                child: InfiniteList(
                  bloc: _bloc,
                  itemBuilder: (context, index) {
                    final pr = state.data[index];
                    return PullRequestTile(
                      pr: pr,
                      onTap: () {
                        Navigator.pushNamed(context, "/pullRequest",
                            arguments: {
                              "pullRequestName": pr.title,
                              "projectName": widget.projectName,
                              "pullRequestId": pr.id,
                              "repositorySlug": widget.repositorySlug,
                              "pullRequest": pr,
                            });
                      },
                    );
                  },
                  fetchMore: LoadPullRequests(
                      projectKey: widget.projectName,
                      repositorySlug: widget.repositorySlug),
                  itemCount: state.data.length,
                ));
          } else if (state is BlocLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Container();
        });
  }
}
