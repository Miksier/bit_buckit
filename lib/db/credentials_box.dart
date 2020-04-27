import 'package:hive/hive.dart';

import 'credentials.dart';

class CredentialsBox {
  static String _boxName = "Credentials";
  Box<Credentials> get  box => Hive.box(_boxName);

   Future init() async {
    Hive.registerAdapter(CredentialsAdapter());
    await Hive.openBox<Credentials>(_boxName);
  }
}
