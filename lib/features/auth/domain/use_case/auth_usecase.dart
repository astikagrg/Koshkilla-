import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/failure/failure.dart';
import '../repository/auth_repository.dart';

final authUseCaseProvider = Provider((ref) {
  return AuthUseCase(
    ref.read(authRepositoryProvider),
  );
});

class AuthUseCase {
  final IAuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<Either<Failure, bool>> registerUser( {
   
    String? image,
    required String email,
    required String username,
    required String password,
  }) async {
    return await _authRepository.registerUser(
      
      image: image,
      email: email,
      username: username,
      password: password,
    );
  }

  Future<Either<Failure, bool>> loginUser(
      String username, String password) async {
    return await _authRepository.loginUser(username, password);
  }

  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return await _authRepository.uploadProfilePicture(file);
  }
}
