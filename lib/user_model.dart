import 'package:hive_ce/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String name;

  @HiveField(1)
  String email;

  UserModel(this.name, this.email);
}