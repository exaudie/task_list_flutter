import 'package:hive/hive.dart';

part 'settings_db.g.dart';

@HiveType(typeId: 1)
class SettingsDb extends HiveObject {
  @HiveField(0)
  String? prefixCode;
}
