import 'package:bucqit/db/user_data.dart';
import 'package:hive/hive.dart';

class UserDataBox {
  static const String _boxName = "UserData";
  Box<UserDate> get box => Hive.box(_boxName);

  Future init() async {
    Hive.registerAdapter(UserDateAdapter());
    await Hive.openBox<UserDate>(_boxName);
  }
}
