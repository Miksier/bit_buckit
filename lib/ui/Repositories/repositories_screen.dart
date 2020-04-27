import 'package:bucqit/models/repositoryDTO.dart';
import 'package:bucqit/ui/Widgets/base_widget.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:bucqit/ui/Widgets/infinite_list.dart';
import 'package:provider/provider.dart';
import 'package:bucqit/ui/Repositories/bloc/repositories_bloc.dart';
import 'package:flutter/material.dart';

class RepositoriesScreen extends StatefulWidget {
  RepositoriesScreen({Key key, this.projectName}) : super(key: key);

  final String projectName;

  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {
  RepositoriesBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = RepositoriesBloc(Provider.of(context));
      _bloc.add(LoadRepositories(projectKey: widget.projectName));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.projectName),
        ),
        body: BaseWidget(
          bloc: _bloc,
          contentBuilder: (BlocLoadedState state) {
            var data = state.data as List<RepositoryDTO>;
            return RefreshIndicator(
              onRefresh: () async {
                _bloc.add(LoadRepositories(projectKey: widget.projectName));
              },
              child: InfiniteList(
                bloc: _bloc,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, '/repository', arguments: {
                          "projectName": widget.projectName,
                          "repositorySlug": data[index].slug
                        });
                      },
                      child: ListTile(
                        title: Text(data[index].name),
                      ));
                },
                fetchMore: LoadRepositories(projectKey: widget.projectName),
                itemCount: data.length,
              ),
            );
          },
        ));
  }
}
