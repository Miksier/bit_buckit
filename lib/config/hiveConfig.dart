import 'package:bucqit/db/credentials_box.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static Future _initializeBoxes() async {
    await CredentialsBox().init();
  }

  static Future init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await _initializeBoxes();
  }
}
