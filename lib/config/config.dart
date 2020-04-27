import 'package:bucqit/api_services/chopper_client_service.dart';
import 'package:bucqit/api_services/projects_api_service.dart';
import 'package:bucqit/api_services/pull_request_api_service.dart';
import 'package:bucqit/api_services/pull_requests_api_service.dart';
import 'package:bucqit/api_services/repositories_api_service.dart';
import 'package:bucqit/api_services/user_api_service.dart';
import 'package:bucqit/api_services/users_api_service.dart';
import 'package:bucqit/db/credentials_box.dart';
import 'package:bucqit/services/comment_service.dart';
import 'package:bucqit/services/project_service.dart';
import 'package:bucqit/services/pull_request_service.dart';
import 'package:bucqit/services/repository_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef S ItemCreator<S>();

class AppConfig {
  AppConfig._();

  static AppColors colors = AppColors();
  static List<Provider> providers = [
    ...boxes,
    ...coreServices,
    ...apiServices,
    ...independentServices,
  ];
}

class AppColors {
  static const appPrimary = Color.fromARGB(255, 7, 71, 166);
  static const conflictColor = Color.fromARGB(255, 255, 171, 0);
  static const approvedColor = Color.fromARGB(255, 0, 135, 90);
  static const unapprovedColor = Color.fromARGB(255, 222, 53, 11);
  static const needsWorkBorderColor = Color.fromARGB(255, 255, 139, 0);
  static const needsWorkTextColor = Color.fromARGB(255, 143, 78, 0);
  static const openedPrBackgroundColor = Color.fromARGB(255, 179, 212, 255);
  static const openedPrTextColor = Color.fromARGB(255, 0, 82, 204);
}

List<Provider> boxes = [
  Provider<CredentialsBox>(create: (context) => CredentialsBox()),
];

List<Provider> coreServices = [
  Provider<ChopperClientService>(
      create: (context) =>
          ChopperClientService(Provider.of(context, listen: false)))
];

List<Provider> independentServices = [
  Provider<ProjectService>(
    create: (context) => ProjectService(Provider.of(context, listen: false)),
  ),
  Provider<CommentService>(
    create: (context) => CommentService(Provider.of(context, listen: false)),
  ),
  Provider<RepositoryService>(
    create: (context) => RepositoryService(Provider.of(context, listen: false)),
  ),
  Provider<PullRequestService>(
    create: (context) => PullRequestService(Provider.of(context, listen: false),Provider.of(context, listen: false)),
  ),
];

List<Provider> apiServices = [
  Provider<ProjectsApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<ProjectsApiService>()),
  Provider<PullRequestApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<PullRequestApiService>()),
  Provider<PullRequestsApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<PullRequestsApiService>()),
  Provider<RepositoriesApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<RepositoriesApiService>()),
  Provider<UserApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<UserApiService>()),
  Provider<UsersApiService>(
      create: (context) =>
          Provider.of<ChopperClientService>(context, listen: false)
              .client
              .getService<UsersApiService>()),
];
