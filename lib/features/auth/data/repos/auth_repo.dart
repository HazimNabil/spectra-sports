import 'package:spectra_sports/core/utils/typedefs.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/user_model.dart';

abstract interface class AuthRepo {
  ApiResult<UserModel> login(LoginBodyModel loginBody);
  ApiResult<UserModel> signUp(SignUpBodyModel signUpBody);
  Future<void> logout();
  Future<UserModel?> checkAuthStatus();
}
