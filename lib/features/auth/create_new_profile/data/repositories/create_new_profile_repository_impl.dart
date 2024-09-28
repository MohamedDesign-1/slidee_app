import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:slidee_app/core/errors/faliures.dart';
import 'package:slidee_app/features/auth/create_new_profile/data/remote/data_sources/create_new_profile_remote_data_source.dart';

import 'package:slidee_app/features/auth/create_new_profile/domain/entities/profile_entity.dart';

import '../../domain/repositories/create_new_profile_repository.dart';

@Injectable(as: CreateNewProfileRepository)
class CreateNewProfileRepositoryImpl implements CreateNewProfileRepository {

  CreateNewProfileRemoteDataSource createNewProfileRemoteDataSource;
  CreateNewProfileRepositoryImpl(this.createNewProfileRemoteDataSource);

  @override
  Future<Either<Faliures, ProfileEntity>> createNewProfile(
      String username, String displayName, String bio, String imageUrl) async {
    var either = await createNewProfileRemoteDataSource.createNewProfile(
        username, displayName, bio, imageUrl);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
