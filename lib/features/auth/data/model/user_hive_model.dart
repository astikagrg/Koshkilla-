import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../../../../config/constants/hive_table_constant.dart';
import '../../domain/entity/user_entity.dart';


// dart run build_runner build --delete-conflicting-outputs
part 'user_hive_model.g.dart';

final userHiveModelProvider = Provider(
  (ref) => UserHiveModel.empty(),
);

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel {
  // HiveObject is a mixin that provides the ability to use Hive objects as keys
  // Which helps in serialization and deserialization
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String username;

  @HiveField(2)
  final String password;

  @HiveField(3)
  final String email;



  //empty constructor
  UserHiveModel.empty()
      : this(
          id: '',
          username: '',
          password: '',
          email: '',
         
        );

  UserHiveModel({
    String? id,
    required this.email,
    required this.username,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, password: $password)';
  }

  //convert entity into model
  UserEntity toEntity() => UserEntity(
        id: id,
        email: email,
        username: username,
        password: password,
      );

  // convert entity into hive object
  UserHiveModel toHiveModel(UserEntity entity) => UserHiveModel(
        id: entity.id,
        email: entity.email,
        username: entity.username,
        password: entity.password,
      );

  //convert entity list to hive list
  List<UserHiveModel> toHiveModelList(List<UserEntity> entities) =>
      entities.map((entity) => toHiveModel(entity)).toList();
}
