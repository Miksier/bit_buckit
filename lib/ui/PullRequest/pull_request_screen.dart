import 'package:bucqit/config/config.dart';
import 'package:bucqit/models/pullRequestActionDTO.dart';
import 'package:bucqit/models/ui/pr_ownership.dart';
import 'package:bucqit/models/ui/pr_state.dart';
import 'package:bucqit/models/ui/pull_request_model.dart';
import 'package:bucqit/ui/PullRequest/widgets/activity_list.dart';
import 'package:bucqit/ui/PullRequest/widgets/bloc/activitylist_bloc.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/base_widget.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:bucqit/ui/Widgets/reviewers_list.dart';
import 'package:bucqit/ui/Widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';

import 'bloc/pullrequest_bloc.dart' as pr;

class PullRequestScreen extends StatefulWidget {
  final String pullRequestName;
  final String pullRequestId;
  final String projectName;
  final String repositorySlug;

  const PullRequestScreen(
      {this.pullRequestName,
      this.projectName,
      this.pullRequestId,
      this.repositorySlug});

  @override
  _PullRequestScreenState createState() => _PullRequestScreenState();
}

class _PullRequestScreenState extends State<PullRequestScreen> {
  pr.PullRequestBloc _bloc;
  ActivitylistBloc _activityListBloc;
  final _scrollController = ScrollController();
  final _scrollThreshold = 400.0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _activityListBloc.add(const LoadActivities());
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = pr.PullRequestBloc(Provider.of(context), Provider.of(context),
          widget.projectName, widget.repositorySlug, widget.pullRequestId);
      _activityListBloc = ActivitylistBloc(Provider.of(context),
          widget.projectName, widget.repositorySlug, widget.pullRequestId);
      loadData();
      loadActivities();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pullRequestName,
          maxLines: 3,
          style: const TextStyle(fontSize: 14),
        ),
      ),
      floatingActionButton: BlocBuilder(
          bloc: _bloc,
          builder: (context, state) {
            if (state is BlocLoadedState) {
              final data = state.data as PullRequestModel;
              return UnicornDialer(
                parentButtonBackground: Colors.grey[700],
                orientation: UnicornOrientation.VERTICAL,
                parentButton: const Icon(Icons.more_horiz),
                childButtons: getFABOptions(data),
              );
            }
            return Container();
          }),
      body: BaseWidget(
        bloc: _bloc,
        reloadBloc: loadData,
        contentBuilder: (state) {
          final data = state.data as PullRequestModel;
          return SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildInformationRow(data),
                    if (data.description != null) buildDescription(data),
                    buildAddComment(),
                    const Text(
                      "Activity:",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    ActivityList(_activityListBloc, widget.projectName,
                        widget.repositorySlug, widget.pullRequestId),
                  ]));
        },
      ),
    );
  }

  Padding buildAddComment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: null,
        textInputAction: TextInputAction.done,
        onSubmitted: (s) {
          _bloc.add(pr.AddComment(message: s));
          loadData();
        },
        decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            hintText: "What do you want to say?"),
        keyboardType: TextInputType.multiline,
      ),
    );
  }

  Padding buildDescription(PullRequestModel data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(data.description),
    );
  }

  Container buildInformationRow(PullRequestModel data) {
    return Container(
      color: AppColors.conflictColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 40,
          child: Row(
            children: <Widget>[
              Avatar(
                size: 40,
                url: data?.author?.user?.avatarUrl ?? "",
                status: "",
              ),
              Expanded(
                  child: Text(
                data?.author?.user?.displayName ?? "",
                maxLines: 2,
              )),
              if (data.tasks.isNotEmpty && data.activeTasks > 0)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildTaskCount(data),
                ),
              ReviewersList(
                reviewers: data.reviewers,
                shownAvatars: 3,
              )
            ],
          ),
        ),
      ),
    );
  }

  List<UnicornButton> getFABOptions(PullRequestModel data) {
    final List<UnicornButton> children = [];
    if (data.ownership == PrOwnership.reviewer) {
      children.add(_profileOption("h",
          label: "remove from reviewers",
          iconData: Icons.remove, onPressed: () {
        removefromReviewers();
      }, backgroundColor: Colors.red));
      if (data.hasApproved) {
        children.add(_profileOption("h",
            label: "remove aproval",
            iconData: Icons.check_circle_outline, onPressed: () {
          _bloc.add(const pr.RemoveApprovePullRequest());
          loadData();
        }, backgroundColor: Colors.green));
      } else {
        children.add(_profileOption("h",
            label: "approve",
            iconData: Icons.check_circle_outline, onPressed: () {
          _bloc.add(const pr.ApprovePullRequest());
          loadData();
        }, backgroundColor: Colors.green));
      }
      children.add(_profileOption("h",
          label: "need work",
          iconData: Icons.error_outline,
          onPressed: () {},
          backgroundColor: Colors.orangeAccent));
    } else if (data.ownership == PrOwnership.author) {
    } else {
      children.add(_profileOption("h",
          label: "add to reviewers", iconData: Icons.add, onPressed: () {
        addToReviewers();
      }));
    }

    return children;
  }

  Widget _profileOption(String heroTag,
      {IconData iconData,
      Function onPressed,
      Color backgroundColor,
      String label,
      Color iconColor}) {
    return UnicornButton(
        hasLabel: true,
        labelText: label,
        currentButton: FloatingActionButton(
          backgroundColor: backgroundColor,
          heroTag: heroTag,
          mini: true,
          onPressed: onPressed,
          child: Icon(
            iconData,
            color: iconColor,
          ),
        ));
  }

  Widget buildMergeState(PullRequestModel data) {
    return data.mergeState == PrMergeState.conflicted
        ? Container(
            color: AppColors.conflictColor,
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("Conflicted",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12)),
            ),
          )
        : const SizedBox.shrink();
  }

  Widget buildActions(List<PullRequestActionDTO> activities) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int i) {
          if (i >= activities.length) return null;
          final PullRequestActionDTO action = activities[i];
          if (action.action == "COMMENTED") {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Avatar(
                            url: action.user.avatarUrl,
                            size: 40,
                            status: "",
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      action.comment.author.displayName,
                                    ),
                                  ),
                                  Text(action.comment.text)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Text(action.comment.comments.length.toString())
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildTaskCount(PullRequestModel data) {
    return TasksList(
      data.tasks.length,
      activeTasks: data.tasks.length - data.activeTasks,
      tasks: data.tasks,
      shoulShowDialog: true,
    );
  }

  void approvePR() {
    _bloc.add(const pr.ApprovePullRequest());
  }

  void addToReviewers() {
    _bloc.add(const pr.AddReviewerPullRequest());
    loadData();
  }

  void removefromReviewers() {
    _bloc.add(const pr.RemoveReviewerPullRequest());
    loadData();
  }

  void loadData() {
    _bloc.add(const pr.LoadDataPullRequest());
  }

  void loadActivities() {
    _activityListBloc.add(const LoadActivities());
  }
}
