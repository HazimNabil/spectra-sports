part of 'auth_cubit.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class Authenticated extends AuthState {
  final UserModel user;

  const Authenticated(this.user);
}

final class Unauthenticated extends AuthState {
  const Unauthenticated();
}

final class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class PasswordChange extends AuthState {
  final String message;

  const PasswordChange(this.message);

  @override
  List<Object> get props => [message];
}
