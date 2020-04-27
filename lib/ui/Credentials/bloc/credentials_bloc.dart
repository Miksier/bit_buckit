import 'dart:convert';

import 'package:bucqit/api_services/user_api_service.dart';
import 'package:bucqit/db/credentials.dart';
import 'package:bucqit/db/credentials_box.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:bucqit/ui/Widgets/base_bloc.dart';
import 'package:bucqit/ui/Widgets/bloc_state.dart';
import 'package:chopper/chopper.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'credentials_event.dart';
part 'credentials_state.dart';

class CredentialsBloc extends BaseBloc<CredentialsEvent> {
  Box<Credentials> _credentialsBox;

  CredentialsBloc(CredentialsBox credentialsBox) : super() {
    _credentialsBox = credentialsBox.box;
  }

  @override
  internalMapEventToState(CredentialsEvent event) async* {
    if (event is ContinueButtonPressed) {
      try {
        final url =
            event.url.contains("http") ? event.url : "http://${event.url}";
        var client = ChopperClient(
          baseUrl: url,
          interceptors: [
            HeadersInterceptor({
              'Authorization': event.token,
              'X-Atlassian-Token': 'no-check',
              'Content-Type': 'application/json;charset=UTF-8'
            })
          ],
          services: [UserApiService.create()],
        );
        var userService = client.getService<UserApiService>();
        var user = await userService.getUser();
        if (user.isSuccessful && user.body.toString().length > 0) {
          Avatar.baseUrl = url;
          _credentialsBox.add(
              Credentials(token: event.token, url: url, userName: user.body));
          yield const BlocLoadedState();
          event.onSuccess();
        } else {
          yield const BlocErrorState();
        }
      } catch (e) {
      }
    } else if (event is TokenButtonPressed) {
      yield TokenInput();
    } else if (event is CredentialsButtonPressed) {
      yield CredentialsInput();
    }
  }

  String getToken(String str) {
    return base64.encode(utf8.encode(str));
  }
}
