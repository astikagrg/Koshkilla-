import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kosh_killa_app/config/constants/app_routes.dart';

import '../../../../core/common/snackbar/my_snackbar.dart';
import '../../domain/use_case/auth_usecase.dart';
import '../state/auth_state.dart';

final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, AuthState>((ref) {
  return AuthViewModel(
    ref.read(authUseCaseProvider),
  );
});

class AuthViewModel extends StateNotifier<AuthState> {
  final AuthUseCase _authUseCase;

  AuthViewModel(this._authUseCase) : super(AuthState(isLoading: false));

  Future<void> registerUser({
    String? image,
    required String email,
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.registerUser(
      image: image,
      email: email,
      username: username,
      password: password,
    );
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showSnackBar(message: failure.error, context: context);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      showSnackBar(message: "User Registered Successfully", context: context);
    });
  }

  Future<void> loginUser(
      BuildContext context, String username, String password) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.loginUser(username, password);
    data.fold((failure) {
      state = state.copyWith(
        isLoading: false,
        error: failure.error,
      );
      showSnackBar(message: "Logged in", context: context);
    }, (success) {
      state = state.copyWith(
        isLoading: false,
        error: null,
      );
      // Navigator.popAndPushNamed(context, AppRoute.homeRoute);
      showSnackBar(message: "User Logged In Successfully", context: context);
    });
  }

  Future<void> uploadProfilePicture(File? file, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    var data = await _authUseCase.uploadProfilePicture(file!);
    data.fold(
      (l) => state = state.copyWith(isLoading: false, error: l.error),
      (imageName) {
        state =
            state.copyWith(isLoading: false, error: null, imageName: imageName);
        // showSnackBar(message: "Image Uploaded Successfully", context: context);
      },
    );
  }
}
