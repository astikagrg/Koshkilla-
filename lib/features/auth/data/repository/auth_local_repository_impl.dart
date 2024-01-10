// import 'dart:io';

// import 'package:dartz/dartz.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:student_clean_arch/core/failure/failure.dart';
// import 'package:student_clean_arch/features/auth/data/data_source/auth_local_data_source.dart';
// import 'package:student_clean_arch/features/auth/domain/repository/auth_repository.dart';

// import '../../../../core/failure/failure.dart';
// import '../../domain/repository/auth_repository.dart';

// final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
//   return AuthLocalRepository(
//     ref.read(authLocalDataSourceProvider),
//   );
// });

// class AuthLocalRepository implements IAuthRepository {
//   final AuthLocalDataSource _authLocalDataSource;

//   AuthLocalRepository(this._authLocalDataSource);

//   @override
//   Future<Either<Failure, bool>> loginStudent(String username, String password) {
//     return _authLocalDataSource.loginStudent(username, password);
//   }

//   @override
//   Future<Either<Failure, String>> uploadProfilePicture(File file) {
//     // TODO: implement uploadProfilePicture
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<Failure, bool>> registerStudent(
//       {required String fname,
//       required String lname,
//       String? image,
//       required String batch,
//       required List<String> courses,
//       required String phone,
//       required String username,
//       required String password}) {
//     // TODO: implement registerStudent
//     throw UnimplementedError();
//   }
// }
