import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaseWidget extends StatefulWidget {
  final BaseBloc bloc;
  final Function reloadBloc;
  final Function contentBuilder;

  BaseWidget({@required this.bloc,this.reloadBloc,@required this.contentBuilder});

  @override
  _BaseWidgetState createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.bloc,
        builder: (context, BlocState state) {
          if (state is BlocLoadingState) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is BlocErrorState) {
            return Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Text(state.errorMessage),
                    MaterialButton(
                      child: Text("Reload page"),
                      onPressed: () {
                        widget?.reloadBloc();
                      },
                    )
                  ],
                ),
              ),
            );
          } else if (state is BlocLoadedState) {
            return widget.contentBuilder(state);
          }
          return Container();
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.bloc.close();
  }
}
