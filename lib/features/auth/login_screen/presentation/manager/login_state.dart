part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginError extends LoginState {
  final Faliures faliures;
  LoginError(this.faliures);
}

final class LoginSuccess extends LoginState {
  final LoginEntity loginEntity;
  LoginSuccess(this.loginEntity);
}
