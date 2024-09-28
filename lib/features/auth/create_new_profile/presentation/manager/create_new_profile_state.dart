part of 'create_new_profile_cubit.dart';

@immutable
sealed class CreateNewProfileState {}

final class CreateNewProfileInitial extends CreateNewProfileState {}

final class CreateNewProfileLoading extends CreateNewProfileState {}

final class CreateNewProfileError extends CreateNewProfileState {
  final Faliures faliures;
  CreateNewProfileError(this.faliures);
}

final class CreateNewProfileSuccess extends CreateNewProfileState {
  final ProfileEntity profileEntity;
  CreateNewProfileSuccess(this.profileEntity);
}


final class UploadImageLoading extends CreateNewProfileState {}

final class UploadImageError extends CreateNewProfileState {
  final Faliures faliures;
  UploadImageError(this.faliures);
}

final class UploadImageSuccess extends CreateNewProfileState {
  final ProfileEntity profileEntity;
  UploadImageSuccess(this.profileEntity);
}
