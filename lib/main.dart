import 'package:bucqit/ui/Credentials/bloc/credentials_bloc.dart';
import 'package:bucqit/ui/Credentials/credentials_screen.dart';
import 'package:bucqit/ui/Projects/projects_screen.dart';
import 'package:bucqit/ui/PullRequest/pull_request_screen.dart';
import 'package:bucqit/ui/Repositories/repositories_screen.dart';
import 'package:bucqit/ui/Repository/repository_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'api_services/chopper_client_service.dart';
import 'api_services/user_api_service.dart';
import 'config/config.dart';
import 'config/hiveConfig.dart';
import 'db/credentials.dart';

Box<Credentials> box;
bool authenticated;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.init();
  await Future.delayed(const Duration(milliseconds: 2000),
      () {}); //todo temporary fix for hive boxes initialization waiting for lazy provider
  authenticated = false;
  box = await Hive.openBox<Credentials>("Credentials");

  // TODO some loading screen?
  if (box.length > 0) {
    try {
      final client = ChopperClientService.fromBox(box).client;
      final userService = client.getService<UserApiService>();
      final user = await userService.getUser();
      authenticated = user.body != "";
    } catch (e) {
      authenticated = false;
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String baseUrl;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: AppConfig.providers,
        child: MultiBlocProvider(
          providers: [
            BlocProvider<CredentialsBloc>(
              create: (BuildContext context) =>
                  CredentialsBloc(Provider.of(context)),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: AppColors.appPrimary),
            // TODO move routes to other file to not make so much mess

            onGenerateRoute: (settings) {
              final Map<String, Object> args =
                  settings.arguments as Map<String, Object>;
              if (settings.name == "/projects") {
                return MaterialPageRoute<ProjectsScreen>(
                  builder: (context) {
                    return ProjectsScreen();
                  },
                );
              } else if (settings.name == "/repositories") {
                return MaterialPageRoute<RepositoriesScreen>(
                  builder: (context) {
                    return RepositoriesScreen(
                      projectName: args["projectName"].toString(),
                    );
                  },
                );
              } else if (settings.name == "/repository") {
                return MaterialPageRoute<RepositoryScreen>(
                  builder: (context) {
                    return RepositoryScreen(
                      projectName: args["projectName"].toString(),
                      repositorySlug: args["repositorySlug"].toString(),
                    );
                  },
                );
              } else if (settings.name == "/pullRequest") {
                return MaterialPageRoute<PullRequestScreen>(
                  builder: (context) {
                    return PullRequestScreen(
                      pullRequestName: args["pullRequestName"].toString(),
                      projectName: args["projectName"].toString(),
                      pullRequestId: args["pullRequestId"].toString(),
                      repositorySlug: args["repositorySlug"].toString(),
                    );
                  },
                );
              } else if (settings.name == "/credentials") {
                return MaterialPageRoute<CredenialsScreen>(
                  builder: (context) {
                    return CredenialsScreen();
                  },
                );
              }
              return MaterialPageRoute<CredenialsScreen>(
                builder: (context) {
                  return CredenialsScreen();
                },
              );
            },
            initialRoute: '/',
            home: authenticated ? ProjectsScreen() : CredenialsScreen(),
          ),
        ));
  }
}
