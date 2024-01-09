import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../domain/repository/auth_repository.dart';
import '../data_source/auth_remote_data_source.dart';

final authRemoteRepoProvider = Provider<IAuthRepository>(
  (ref) => AuthRemoteRepoImpl(
    authRemoteDataSource: ref.read(authRemoteDataSourceProvider),
  ),
);

class AuthRemoteRepoImpl implements IAuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRemoteRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> loginUser(String username, String password) {
    return authRemoteDataSource.loginUser(username, password);
  }

  @override
  Future<Either<Failure, bool>> registerUser({
    String? image,
    required String email,
    required String username,
    required String password,
  }) {
    return authRemoteDataSource.registerUser(
      image: image,
      email: email,
      username: username,
      password: password,
    );
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return authRemoteDataSource.uploadProfilePicture(file);
  }
}
