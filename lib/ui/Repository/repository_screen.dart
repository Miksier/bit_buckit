import 'package:bucqit/ui/Repository/Dashboard/dashbaord_screen.dart';
import 'package:bucqit/ui/Repository/PullRequests/pull_requests_screen.dart';
import 'package:bucqit/ui/Repository/bloc/repository_bloc.dart';
import 'package:chopper/chopper.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

enum Module { dashboard, pull_requests, source_code, commits, branches }

class RepositoryScreen extends StatefulWidget {
  RepositoryScreen({Key key, this.projectName, this.repositorySlug})
      : super(key: key);

  final String projectName;
  final String repositorySlug;

  @override
  _RepositoryScreenState createState() => _RepositoryScreenState();
}

class _RepositoryScreenState extends State<RepositoryScreen> {
  RepositoryBloc _bloc;
  ChopperClient chopper;
  Module selectedModule = Module.pull_requests;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = RepositoryBloc(Provider.of(context));
      _bloc.add(LoadPullRequest(
          projectKey: widget.projectName,
          repositorySlug: widget.repositorySlug));
    }
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(widget.repositorySlug),
      ),
      body: buildBody(),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Projekty'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Repozytoria'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Log out'),
            onTap: () {
              Navigator.pushReplacementNamed(
                context,
                "/credentials",
              );
            },
          ),
        ],
      ),
    );
  }

  buildBody() {
    switch (selectedModule) {
      case Module.pull_requests:
        return PullRequestsScreen(
          projectName: widget.projectName,
          repositorySlug: widget.repositorySlug,
        );
      case Module.dashboard:
        return DashboardScreen();
      default:
        return Container();
    }
  }
}
