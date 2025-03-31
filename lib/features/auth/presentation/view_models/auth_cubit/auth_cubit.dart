import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra_sports/features/auth/data/models/login_body_model.dart';
import 'package:spectra_sports/features/auth/data/models/sign_up_body_model.dart';
import 'package:spectra_sports/features/auth/data/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;

  AuthCubit(this._authRepo) : super(const AuthInitial());

  Future<void> login(LoginBodyModel loginBody) async {
    final result = await _authRepo.login(loginBody);

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const Authenticated()),
    );
  }

  Future<void> signUp(SignUpBodyModel signUpBody) async {
    final result = await _authRepo.signUp(signUpBody);

    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (_) => emit(const Authenticated()),
    );
  }

  Future<void> logout() async {
    await _authRepo.logout();
    emit(const Unauthenticated());
  }

  Future<void> checkAuthStatus() async {
    final isAuthenticated = await _authRepo.checkAuthStatus();
    emit(isAuthenticated ? const Authenticated() : const Unauthenticated());
  }
}
