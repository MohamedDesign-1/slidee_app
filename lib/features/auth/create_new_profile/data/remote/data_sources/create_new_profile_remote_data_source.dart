import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/faliures.dart';
import '../../../domain/entities/profile_entity.dart';

abstract class CreateNewProfileRemoteDataSource {
  Future<Either<Faliures, ProfileEntity>> createNewProfile(String username, String displayName, String bio, String imageUrl);
  }