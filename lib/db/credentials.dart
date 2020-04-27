import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'credentials.g.dart';

@HiveType(typeId: 0)
class Credentials extends HiveObject with EquatableMixin {
  @HiveField(0)
  final String url;
  @HiveField(1)
  final String token;
  @HiveField(2)
  final String userName;

  Credentials({
    this.url,
    this.token,
    this.userName
  });

  @override
  List<Object> get props => [url,token,userName];
}
