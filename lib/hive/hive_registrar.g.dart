// Generated by Hive CE
// Do not modify
// Check in to version control

import 'package:hive_ce/hive.dart';
import 'package:christian_app/hive/hive_adapters.dart';
import 'package:christian_app/user_model.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(MyModelAdapter());
    registerAdapter(UserModelAdapter());
  }
}
