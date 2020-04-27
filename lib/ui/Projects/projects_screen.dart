import 'package:bucqit/models/projectDTO.dart';
import 'package:bucqit/ui/Projects/bloc/projects_bloc.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/base_widget.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:bucqit/ui/Widgets/infinite_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class ProjectsScreen extends StatefulWidget {
  ProjectsScreen({Key key}) : super(key: key);

  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  ProjectsBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = ProjectsBloc(Provider.of(context));
      _bloc.add(const LoadProjects());
    }
    return Scaffold(
        appBar: AppBar(
          title: Text("projects"),
        ),
        body: BaseWidget(
            bloc: _bloc,
            contentBuilder: (BlocLoadedState state) {
              var data = state.data as List<ProjectDTO>;
              return RefreshIndicator(
                onRefresh: () async {
                  _bloc.add(const LoadProjects());
                },
                child: InfiniteList(
                  bloc: _bloc,
                  fetchMore: const LoadProjects(),
                  itemBuilder: (context, index) {
                    var url = "${MyApp.baseUrl}${data[index].avatarUrl}";
                    return InkWell(
                        onTap: () async {
                          Navigator.pushNamed(context, '/repositories',
                              arguments: {"projectName": data[index].key});
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 30,
                            child: Row(
                              children: [
                                // TODO add proejct avatar
                                Text(data[index].name),
                              ],
                            ),
                          ),
                        ));
                  },
                  itemCount: data.length,
                ),
              );
            }));
  }
}
