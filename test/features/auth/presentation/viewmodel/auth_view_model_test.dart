import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kosh_killa_app/core/failure/failure.dart';
import 'package:kosh_killa_app/features/auth/domain/use_case/auth_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_view_model_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AuthUseCase>(),
  MockSpec<BuildContext>(),
])
void main() {
  late AuthUseCase mockAuthUsecase;
  late BuildContext mockBuildContext;
  late Failure mockFailure;
  group('Login Test', () {
    setUpAll(() async {
      mockAuthUsecase = MockAuthUseCase();
      mockBuildContext = MockBuildContext();
    });
    test('test login with credential', () async {
      when(mockAuthUsecase.loginUser('astika', 'password123')).thenAnswer(
        (_) async => const Right(true),
      );

      final result = await mockAuthUsecase.loginUser('astika', 'password123');
      expect(result, const Right(true));
    });

    test('test login without credential', () async {
      mockFailure = Failure(error: "Please enter your username and password");
      when(mockAuthUsecase.loginUser('', '')).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.loginUser('', '');
      expect(result, Left(mockFailure));
    });

    test('test login without username', () async {
      mockFailure = Failure(error: "Please enter your username");
      when(mockAuthUsecase.loginUser('', 'Password123')).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.loginUser('', 'Password123');
      expect(result, Left(mockFailure));
    });

       test('failure test login without username ', () async {
      mockFailure = Failure(error: "Please enter your username");
      when(mockAuthUsecase.loginUser('', 'Password1234')).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.loginUser('', 'Password123');
      expect(result, Left(mockFailure));
    });

    test('test login with credential', () async {
      mockFailure = Failure(error: "Please enter your password");
      when(mockAuthUsecase.loginUser('astika', '')).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.loginUser('astika', '');
      expect(result, Left(mockFailure));
    });
  });

  group('Signup Test', () {
    setUpAll(() async {
      mockAuthUsecase = MockAuthUseCase();
      mockBuildContext = MockBuildContext();
    });
    test('test signup with credential', () async {
      when(mockAuthUsecase.registerUser(
        email: 'astika@gmail.com',
        username: 'astika',
        password: 'password123',
      )).thenAnswer(
        (_) async => const Right(true),
      );

      final result = await mockAuthUsecase.registerUser(
        email: 'astika@gmail.com',
        username: 'astika',
        password: 'password123',
      );
      expect(result, const Right(true));
    });

    test('test signup without credential', () async {
      mockFailure =
          Failure(error: "Please enter your email,username and password");
      when(mockAuthUsecase.registerUser(
        email: '',
        username: '',
        password: '',
      )).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.registerUser(
        email: '',
        username: '',
        password: '',
      );
      expect(result, Left(mockFailure));
    });

    test('test signup without username', () async {
      mockFailure = Failure(error: "Please enter your username");
      when(mockAuthUsecase.registerUser(
        email: 'astika@gmail.com',
        username: '',
        password: 'password123',
      )).thenAnswer(
        (_) async => Left(mockFailure),
      );

      final result = await mockAuthUsecase.registerUser(
        email: 'astika@gmail.com',
        username: '',
        password: 'password123',
      );
      expect(result, Left(mockFailure));
    });
  });
}
