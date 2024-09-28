part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterError extends RegisterState {
  final Faliures message;
  RegisterError(this.message);
}

final class RegisterSuccess extends RegisterState {
  final RegisterUserEntity registerUserEntity ;
  RegisterSuccess(this.registerUserEntity);
}