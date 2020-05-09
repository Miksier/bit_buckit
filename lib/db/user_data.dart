import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_data.g.dart';

@HiveType(typeId: 0)
class UserDate extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String projectKey;
  @HiveField(1)
  final String repositorySlug;
  @HiveField(2)
  final int pullRequestId;
  @HiveField(3)
  final String userName;

  UserDate(
      {this.projectKey,
      this.pullRequestId,
      this.repositorySlug,
      this.userName});

  @override
  List<Object> get props =>
      [projectKey, repositorySlug, pullRequestId, userName];
}
