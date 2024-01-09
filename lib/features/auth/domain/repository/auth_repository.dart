import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../../data/repository/auth_remote_repository_impl.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepoProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerUser({
    String? image,
    required String email,
    required String username,
    required String password,
  });
  Future<Either<Failure, bool>> loginUser(String username, String password);
  Future<Either<Failure, String>> uploadProfilePicture(File file);
}
