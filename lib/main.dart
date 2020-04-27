import 'package:bucqit/ui/Credentials/credentials_screen.dart';
import 'package:bucqit/ui/Projects/projects_screen.dart';
import 'package:bucqit/ui/PullRequest/pull_request_screen.dart';
import 'package:bucqit/ui/Repositories/repositories_screen.dart';
import 'package:bucqit/ui/Repository/repository_screen.dart';
import 'package:bucqit/ui/Widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import 'config/config.dart';
import 'config/hiveConfig.dart';
import 'db/credentials.dart';

Box<Credentials> box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HiveConfig.init();
  await Future.delayed(const Duration(milliseconds: 1000),
      () {}); //todo temporary fix for hive boxes initialization waiting for lazy provider

  box = await Hive.openBox<Credentials>("Credentials");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static String baseUrl;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (box.length > 0) {
      var user = box.values.first;
      Avatar.baseUrl = user.url;
      baseUrl =  user.url;
    }

    return MultiProvider(
      providers: AppConfig.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: AppColors.appPrimary),
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
        home: box.length > 0 ? ProjectsScreen() : CredenialsScreen(),
      ),
    );
  }
}
