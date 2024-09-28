part of 'fetchprofile_cubit.dart';

@immutable
abstract class FetchprofileState {}

class FetchProfileInitial extends FetchprofileState {}

class FetchProfileLoading extends FetchprofileState {}

class FetchProfileError extends FetchprofileState {
  final Faliures message;
  FetchProfileError(this.message);
}

class FetchProfileLoaded extends FetchprofileState {
  final FetchProfileModelDto profile;

  FetchProfileLoaded(this.profile);
}

