import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../failure/failure.dart';

// provider
final userSharedPrefsProvider = Provider((ref) => UserSharedPrefs());

class UserSharedPrefs {
  late SharedPreferences _sharedPreferences;

  // set user tokens
  Future<Either<Failure, bool>> setUserTokens(String token) async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      await _sharedPreferences.setString('token', token);
      return right(true);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }

  // get user tokens
  Future<Either<Failure, String>> getUserTokens() async {
    try {
      _sharedPreferences = await SharedPreferences.getInstance();
      String token = _sharedPreferences.getString('token') ?? '';
      return right(token);
    } catch (e) {
      return left(Failure(error: e.toString()));
    }
  }
}
