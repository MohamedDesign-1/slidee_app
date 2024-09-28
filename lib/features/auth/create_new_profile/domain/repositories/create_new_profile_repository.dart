import 'package:dartz/dartz.dart';
import 'package:slidee_app/features/auth/create_new_profile/domain/entities/profile_entity.dart';

import '../../../../../core/errors/faliures.dart';

abstract class CreateNewProfileRepository {
  Future<Either<Faliures, ProfileEntity>> createNewProfile(String username, String displayName , String bio , String imageUrl);
}