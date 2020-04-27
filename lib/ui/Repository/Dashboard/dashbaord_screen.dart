import 'package:bucqit/config/config.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import 'bloc/dashboard_bloc.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.projectName}) : super(key: key);

  final String projectName;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = DashboardBloc();
      _bloc.add(LoadDashboard());
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.projectName),
        ),
        body: BlocBuilder(
          bloc: _bloc,
          builder: (BuildContext context, state) {
            if (state is BlocLoadedState) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () async {
                        var sp = await SharedPreferences.getInstance();
                        await sp.setString('project', widget.projectName);
                        await sp.setString('repo', state.data[index].slug);
                        // Navigator.pushNamedAndRemoveUntil(
                        //     context, '/repository', (Route<dynamic> route) => false,
                        //     arguments: {"projectName":widget.projectName,"repositorySlug":Dashboard[index].slug});
                        Navigator.pushNamed(context, '/repository', arguments: {
                          "projectName": widget.projectName,
                          "repositorySlug": state.data[index].slug
                        });
                      },
                      child: ListTile(
                        title: Text(state.data[index].name),
                      ));
                },
              );
            } else if (state is BlocLoadingState) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else
            return Container(width: 0, height: 0,);
          },
        ));
  }

 

}
