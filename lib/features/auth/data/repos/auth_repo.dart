import 'package:dartz/dartz.dart';
import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';

abstract interface class AuthRepo {
  ApiResult<Unit> login(LoginBodyModel loginBody);
  ApiResult<Unit> signUp(SignUpBodyModel signUpBody);
  Future<void> logout();
  Future<bool> checkAuthStatus();
}
