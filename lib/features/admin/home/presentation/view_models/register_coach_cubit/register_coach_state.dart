part of 'register_coach_cubit.dart';

sealed class RegisterCoachState extends Equatable {
  const RegisterCoachState();

  @override
  List<Object> get props => [];
}

final class RegisterCoachInitial extends RegisterCoachState {
  const RegisterCoachInitial();
}

final class RegisterCoachLoading extends RegisterCoachState {
  const RegisterCoachLoading();
}

final class RegisterCoachSuccess extends RegisterCoachState {
  const RegisterCoachSuccess();
}

final class RegisterCoachFailure extends RegisterCoachState {
  final String message;

  const RegisterCoachFailure(this.message);

  @override
  List<Object> get props => [message];
}
