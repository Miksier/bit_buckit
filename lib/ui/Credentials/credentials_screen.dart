import 'dart:convert';
import 'dart:ui';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:bucqit/ui/Widgets/circular_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'bloc/credentials_bloc.dart';

class CredenialsScreen extends StatefulWidget {
  CredenialsScreen() : super();

  @override
  _CredenialsScreenState createState() => _CredenialsScreenState();
}

class _CredenialsScreenState extends State<CredenialsScreen> {
  final _urlController = TextEditingController();
  final _tokenController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  CredentialsBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc ??= CredentialsBloc(Provider.of(context));
    return Scaffold(
        body: BlocBuilder(
      bloc: _bloc,
      builder: (c, s) {
        return buildMainContent(s);
      },
    ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget buildInitialState(BlocState state) {
    List<Widget> widgets = [];

    if (state is BlocLoadingState) {
      widgets = buildLoadingIndicator();
    }
    if (state is BlocLoadedState) {
      widgets = buildSuccessIndicator();
    }
    if (state is BlocErrorState) {
      widgets = buildErrorIndicator(state);
    }

    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          children: <Widget>[buildMainContent(state), ...widgets],
        ));
  }

  Container buildMainContent(state) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.blue,
                          child: Text("Credentials"),
                          onPressed: () {
                            _bloc.add(CredentialsButtonPressed());
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FlatButton(
                          color: Colors.blue,
                          child: Text("Token"),
                          onPressed: () {
                            _bloc.add(TokenButtonPressed());
                          },
                        ),
                      ),
                    ],
                  ),
                  ...state is TokenInput
                      ? [
                          CircularTextField(
                            urlController: _tokenController,
                            hintString: "Token",
                          ),
                           CircularTextField(
                            urlController: _urlController,
                            hintString: "Url",
                          ),
                        ]
                      : [
                          CircularTextField(
                            urlController: _loginController,
                            hintString: "Login",
                          ),
                          CircularTextField(
                            urlController: _passwordController,
                            hintString: "Password",
                            obscureText: true
                          ),
                          CircularTextField(
                            urlController: _urlController,
                            hintString: "Url",
                          )
                        ],
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: _onLoginButtonPressed,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text("Log in"),
                  ),
                ),
              ],
            ),
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ]),
    );
  }

  _onLoginButtonPressed() async {
    _bloc.add(ContinueButtonPressed(
        url: _urlController.text,
        token: _bloc.state is TokenInput
            ? "Bearer ${_tokenController.text}"
            : "Basic ${toBase64(_loginController.text.trim() + ":" + _passwordController.text.trim())}",
        onSuccess: () {
          Navigator.pushReplacementNamed(context, '/projects');
        }));
  }

  String toBase64(String str) {
    var bytes = utf8.encode(str);
    var base64Str = base64.encode(bytes);
    return base64Str;
  }

  buildLoadingIndicator() {
    return [
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(color: Colors.black.withOpacity(0)),
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          height: 150,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text("loading"),
              )
            ],
          ),
        ),
      )
    ];
  }

  buildSuccessIndicator() {
    return [
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: Container(color: Colors.black.withOpacity(0)),
      ),
      Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          height: 150,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.check),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text("loading"),
              )
            ],
          ),
        ),
      )
    ];
  }

  buildErrorIndicator(BlocState state) {
    if (state is BlocErrorState)
      return [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Container(color: Colors.black.withOpacity(0)),
        ),
        Center(
          child: Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
                borderRadius:
                    new BorderRadius.all(const Radius.circular(20.0))),
            height: 200,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.error),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child:
                        Text(state.errorMessage ?? state.errorCode.toString()),
                  ),
                  FlatButton(
                    color: Colors.blue,
                    child: Text("retry"),
                    onPressed: _onLoginButtonPressed,
                  )
                ],
              ),
            ),
          ),
        )
      ];
  }
}
